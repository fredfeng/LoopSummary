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
        INDEX = 1
        GUARD = 2
        READ = 3
        WRITTEN = 4

    def pprint_refinement(self):
        enums = { 1: "INDEX", 2: "GUARD", 3: "READ", 4: "WRITTEN" }
        for e, vrs in self.types.items():
            print("{0}: {1}".format(enums[e], set(map(str, vrs))))

    def fetch_points_to(self, value):
        if not (isinstance(value, LocalIRVariable) and value.is_storage):
            if isinstance(value, ReferenceVariable):
                return value.points_to
        return None

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
            print(ir.value)
            guard += [ir.value]
        return guard

    def get_write_constant(self, ir):
        written = []
        if isinstance(ir, Assignment):
            written.append(ir.lvalue)            
            lvalue_pts_to = self.fetch_points_to(ir.lvalue)
            if lvalue_pts_to: written.append(lvalue_pts_to)
        return written

    def get_read(self, ir):
        read = []
        if isinstance(ir, Condition):
            read += [ir.value]
        return read
    
    def compute_function(self, function):
        # TODO: HANDLE ANY FUNCTION NAME
        if function.name != "foo":
            return
        
        self.types[self.Typ.INDEX] = []
        self.types[self.Typ.GUARD] = []
        self.types[self.Typ.WRITTEN] = []
        self.types[self.Typ.READ] = []        
                        
        is_protected = function.is_protected()
        test = 0
        for node in function.nodes:
            for ir in node.irs_ssa:
                if not isinstance(ir, Phi):
                    self.types[self.Typ.INDEX] += self.get_index(ir)
                    self.types[self.Typ.GUARD] += self.get_guard(ir)
                    self.types[self.Typ.WRITTEN] += self.get_write_constant(ir)
                    self.types[self.Typ.READ] += self.get_read(ir)
                    
        self.types = self.convert_to_non_ssa(self.types)

    def convert_to_non_ssa(self, data_depencies):
        # Need to create new set() as its changed during iteration
        ret = dict()
        for (k, values) in data_depencies.items():
            ret[k] = list(map(self.convert_variable_to_non_ssa, values))

        return ret
        
