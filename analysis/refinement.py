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
        
