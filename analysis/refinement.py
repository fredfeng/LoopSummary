from analysis import Analysis
from enum import Enum

from slither.core.declarations import (Contract, Enum, Function,
                                       SolidityFunction, SolidityVariable,
                                       SolidityVariableComposed, Structure)
from slither.slithir.operations import (Index, OperationWithLValue, InternalCall,
                                        Phi, Condition, Operation, Assignment)
from slither.slithir.variables import (Constant, LocalIRVariable,
                                       ReferenceVariable, ReferenceVariableSSA,
                                       StateIRVariable, TemporaryVariable,
                                       TemporaryVariableSSA, TupleVariableSSA)
from slither.core.solidity_types.type import Type


class Refinement(Analysis):

    types = {}
    
    class Typ(Enum):
        READ = 1
        WRITTEN = 2
        INDEX = 3
        GUARD = 4

    def pprint_refinement(self):
        enums = { 1: "READ", 2: "WRITTEN", 3: "INDEX", 4: "GUARD" }
        for e, vrs in self.types.items():
            print("{0}: {1}".format(enums[e], set(map(str, vrs))))

    def get_read2(self, ir, value=None):
        read = []
        if isinstance(ir, Assignment):
            read += [ir.rvalue]
        if isinstance(ir, Index):            
            if not (isinstance(ir.rvalue, LocalIRVariable) and ir.rvalue.is_storage):
                if isinstance(ir.rvalue, ReferenceVariable):
                    read += [ir.rvalue.points_to]
        return read
            
    def get_read(self, ir, value=None):
        if isinstance(ir, OperationWithLValue) and ir.lvalue:
            value = ir.lvalue
            if not (isinstance(value, LocalIRVariable) and value.is_storage):
                if isinstance(value, ReferenceVariable):
                    value = value.points_to
        if isinstance(ir, Index):
            if value:
                value_split = str(value).split('_')
                value_base = value_split[0] if len(value_split) > 0 else None
                ir_split = str(ir.variable_left).split('_')
                ir_base = ir_split[0] if len(ir_split) > 0 else None
                print(ir_base, value_base)
                # AVOID SELF DEPENDENCE?        
                if ir_base == value_base:
                    return []
                # if value == ir.variable_left:
                #     return
            read = [ir.variable_left, ir.variable_right]
        elif isinstance(ir, InternalCall):
            read = ir.function.return_values_ssa
        elif isinstance(ir, Assignment):
            print(ir.lvalue, ir.rvalue)
            read = []
        else:
            print("HERE: {0}".format(type(ir)))
            read = ir.read

        return read
            
    def add_lvalue(self, lvalue, function, ir, is_protected):
        if not lvalue in function.context[self.KEY_SSA]:
            function.context[self.KEY_SSA][lvalue] = set()
            if not is_protected:
                function.context[self.KEY_SSA_UNPROTECTED][lvalue] = set()
        read = self.get_read(ir, lvalue)
        # print("{0}: {1}".format(lvalue, list(map(lambda i: i.name, read))))
        [function.context[self.KEY_SSA][lvalue].add(v) for v in read if not isinstance(v, Constant)]
        if not is_protected:
            [function.context[self.KEY_SSA_UNPROTECTED][lvalue].add(v) for v in read if not isinstance(v, Constant)]

    def fetch_points_to(self, value):
        if not (isinstance(value, LocalIRVariable) and value.is_storage):
            if isinstance(value, ReferenceVariable):
                return value.points_to
        return None
        
    def get_written(self, ir, value):
        written = []
        if not (isinstance(value, LocalIRVariable) and value.is_storage):
            if isinstance(value, ReferenceVariable):
                lvalue = value.points_to
                if lvalue:
                    written.append(lvalue)
            written.append(value)

        return written

    def get_index(self, ir):
        idx = []
        if isinstance(ir, Index):
            idx += [ir.variable_right]
            pts_to = self.fetch_points_to(ir.variable_right)
            if pts_to: idx += [pts_to]

        return idx
    
    def get_guard(self, ir):
        guard = []
        if isinstance(ir, Condition):
            guard += [ir.value]
        return guard
    
    def compute_function(self, function):
        self.types = {}
        self.types[self.Typ.INDEX] = []
        self.types[self.Typ.GUARD] = []        
                        
        is_protected = function.is_protected()
        test = 0
        for node in function.nodes:
            for ir in node.irs_ssa:
                if not isinstance(ir, Phi):
                    self.types[self.Typ.INDEX] += self.get_index(ir)
                    self.types[self.Typ.GUARD] += self.get_guard(ir)                

        self.types = self.convert_to_non_ssa(self.types)

    def convert_to_non_ssa(self, data_depencies):
        # Need to create new set() as its changed during iteration
        ret = dict()
        for (k, values) in data_depencies.items():
            ret[k] = list(map(self.convert_variable_to_non_ssa, values))

        return ret
        
