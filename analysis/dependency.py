from analysis import Analysis

from slither.core.declarations import (Contract, Enum, Function,
                                       SolidityFunction, SolidityVariable,
                                       SolidityVariableComposed, Structure)
from slither.slithir.operations import (Index, OperationWithLValue, InternalCall,
                                        Phi)
from slither.slithir.variables import (Constant, LocalIRVariable,
                                       ReferenceVariable, ReferenceVariableSSA,
                                       StateIRVariable, TemporaryVariable,
                                       TemporaryVariableSSA, TupleVariableSSA)
from slither.core.solidity_types.type import Type


class Dependency(Analysis):

    dependencies = {}
    
    def is_dependent(self, variable, source, context, only_unprotected=False):
        '''
        Args:
            variable (Variable)
            source (Variable)
            context (Contract|Function)
            only_unprotected (bool): True only unprotected function are considered
        Returns:
            bool
        '''
        assert isinstance(context, (Contract, Function))
        if isinstance(variable, Constant):
            return False
        if variable == source:
            return True
        context = context.context

        print(context[self.KEY_NON_SSA][variable])

        if only_unprotected:
            return variable in context[self.KEY_NON_SSA_UNPROTECTED] and source in context[self.KEY_NON_SSA_UNPROTECTED][variable]
        return variable in context[self.KEY_NON_SSA] and source in context[self.KEY_NON_SSA][variable]

    def is_dependent_ssa(self, variable, source, context, only_unprotected=False):
        '''
        Args:
            variable (Variable)
            taint (Variable)
            context (Contract|Function)
            only_unprotected (bool): True only unprotected function are considered
        Returns:
            bool
        '''
        assert isinstance(context, (Contract, Function))
        context = context.context
        if isinstance(variable, Constant):
            return False
        if variable == source:
            return True
        if only_unprotected:
            return variable in context[self.KEY_SSA_UNPROTECTED] and source in context[self.KEY_SSA_UNPROTECTED][variable]
        return variable in context[self.KEY_SSA] and source in context[self.KEY_SSA][variable]

    GENERIC_TAINT = {SolidityVariableComposed('msg.sender'),
                     SolidityVariableComposed('msg.value'),
                     SolidityVariableComposed('msg.data'),
                     SolidityVariableComposed('tx.origin')}

    def is_tainted(self, variable, context, only_unprotected=False, ignore_generic_taint=False):
        '''
            Args:
            variable
            context (Contract|Function)
            only_unprotected (bool): True only unprotected function are considered
        Returns:
            bool
        '''
        assert isinstance(context, (Contract, Function))
        assert isinstance(only_unprotected, bool)
        if isinstance(variable, Constant):
            return False
        slither = context.slither
        taints = slither.context[self.KEY_INPUT]
        if not ignore_generic_taint:
            taints |= GENERIC_TAINT
        return variable in taints or any(is_dependent(variable, t, context, only_unprotected) for t in taints)

    def is_tainted_ssa(self, variable, context, only_unprotected=False, ignore_generic_taint=False):
        '''
        Args:
            variable
            context (Contract|Function)
            only_unprotected (bool): True only unprotected function are considered
        Returns:
            bool
        '''
        assert isinstance(context, (Contract, Function))
        assert isinstance(only_unprotected, bool)
        if isinstance(variable, Constant):
            return False
        slither = context.slither
        taints = slither.context[self.KEY_INPUT_SSA]
        if not ignore_generic_taint:
            taints |= GENERIC_TAINT
        return variable in taints or any(is_dependent_ssa(variable, t, context, only_unprotected) for t in taints)


    def get_dependencies(self, variable, context, only_unprotected=False):
        '''
        Args:
            variable
            context (Contract|Function)
            only_unprotected (bool): True only unprotected function are considered
        Returns:
            list(Variable)
        '''
        assert isinstance(context, (Contract, Function))
        assert isinstance(only_unprotected, bool)
        if only_unprotected:
            return context.context[self.KEY_NON_SSA].get(variable, [])
        return context.context[self.KEY_NON_SSA_UNPROTECTED].get(variable, [])


    def pprint_dependency(self, context=None):
        if context: context = context.context
        print('#### NON SSA ####')
        if context:
            items = context[self.KEY_NON_SSA].items()
        else:
            items = self.dependencies.items()
        for k, values in items:
            print('{} ({}):'.format(k, hex(id(k))))
            for v in values:
                print('\t- {} ({})'.format(v, hex(id(v))))

    def add(self, lvalue, function, ir, is_protected):
        if not lvalue in function.context[self.KEY_SSA]:
            function.context[self.KEY_SSA][lvalue] = set()
            if not is_protected:
                function.context[self.KEY_SSA_UNPROTECTED][lvalue] = set()
        if isinstance(ir, Index):
            lvalue_split = str(lvalue).split('_')
            lvalue_base = lvalue_split[0] if len(lvalue_split) > 0 else None
            ir_split = str(ir.variable_left).split('_')
            ir_base = ir_split[0] if len(ir_split) > 0 else None
            # AVOID SELF DEPENDENCE?        
            if ir_base == lvalue_base:
                return
            # if lvalue == ir.variable_left:
            #     return
            read = [ir.variable_left, ir.variable_right]
        elif isinstance(ir, InternalCall):
            read = ir.function.return_values_ssa
        else:
            read = ir.read
        [function.context[self.KEY_SSA][lvalue].add(v) for v in read if not isinstance(v, Constant)]
        if not is_protected:
            [function.context[self.KEY_SSA_UNPROTECTED][lvalue].add(v) for v in read if not isinstance(v, Constant)]


    def compute_function(self, function):
        # if self.KEY_SSA in function.context:
        #     return

        function.context[self.KEY_SSA] = dict()
        function.context[self.KEY_SSA_UNPROTECTED] = dict()

        is_protected = function.is_protected()
        test = 0
        for node in function.nodes:
            for ir in node.irs_ssa:
                if isinstance(ir, OperationWithLValue) and ir.lvalue and not isinstance(ir, Phi):
                    # if isinstance(ir, OperationWithLValue) and ir.lvalue:               
                    if test > -1:
                        if isinstance(ir.lvalue, LocalIRVariable) and ir.lvalue.is_storage:
                            test += 1
                            continue
                        if isinstance(ir.lvalue, ReferenceVariable):
                            lvalue = ir.lvalue.points_to
                            if lvalue:
                                self.add(lvalue, function, ir, is_protected)
                        self.add(ir.lvalue, function, ir, is_protected)
                    test += 1

        function.context[self.KEY_NON_SSA] = self.convert_to_non_ssa(function.context[self.KEY_SSA])
        function.context[self.KEY_NON_SSA_UNPROTECTED] = self.convert_to_non_ssa(function.context[self.KEY_SSA_UNPROTECTED])
