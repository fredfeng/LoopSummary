from typing import Callable, NamedTuple, List, Any
from tyrell.decider.decider import Decider
from tyrell.interpreter import Interpreter
from tyrell.decider.result import ok, bad
from slither import Slither

# node types
from slither.slithir.operations.assignment import Assignment
from slither.slithir.operations.binary import Binary
from slither.slithir.operations.index import Index
from slither.slithir.operations.condition import Condition

from slither.slithir.variables.reference import ReferenceVariable
from slither.solc_parsing.variables.state_variable import StateVariableSolc
from slither.solc_parsing.variables.local_variable import LocalVariableSolc
from slither.slithir.variables.temporary import TemporaryVariable

class BoundedModelCheckerDecider(Decider):
    _interpreter: Interpreter
    _example: None
    _equal_output: Callable[[Any, Any], bool]
    _org_contract = None

    def __init__(self,
                 interpreter: Interpreter,
                 example: Any,
                 equal_output: Callable[[Any, Any], bool] = lambda x, y: x == y):
        self._interpreter = interpreter
        self._example = example
        self._equal_output = equal_output
        self._tmp_counter = -1 # temporary variable counter
        self._ref_counter = -1 # temporary variable counter

        # (debug) see what is the source contract first
        _ = self.extract_ir_from_source(self._example)
        # input("DOUBLE-CHECK")

    @property
    def interpreter(self):
        return self._interpreter

    @property
    def example(self):
        return self._example

    @property
    def equal_output(self):
        return self._equal_output

    def get_fresh_ref_name(self):
        self._ref_counter += 1
        # use "DEF" because "REF" is originally used in Slither IR
        return "DEF_{}".format(self._ref_counter)

    def get_fresh_tmp_name(self):
        self._tmp_counter += 1
        # use "DMP" because "TMP" is originally used in Slither IR
        return "DMP_{}".format(self._tmp_counter)

    def is_equivalent(self, prog):
        '''
        Test the program on all examples provided.
        Return a list of failed examples.
        '''
        candidate_prog = self.interpreter.eval(prog, None)
        # print("current candidate program:-------------")
        # print(candidate_prog)
        # print("target program:", self._example) 
        # print("verifyer: ", self._equal_output)
        # print("candidate program: {}".format(candidate_prog))
        if not self._org_contract:
            print('source contract is empty')
            inst_list, write = self.extract_ir_from_source(self._example)
            self._org_contract = (inst_list, write)

        # trigger Bounded Model Checker
        return self._equal_output(candidate_prog, self._org_contract)

    def analyze(self, prog):
        '''
        This basic version of analyze() merely interpret the AST and see if it conforms to our examples
        '''
        if self.is_equivalent(prog):
            return ok()
        else:
            return bad()

    def assemble_assignment(self, curr_addr, raw_irs):
        # (Assignment,)
        inst_list = []
        ir = raw_irs[0]
        inst = "{}: {} = {}".format(hex(curr_addr), ir.lvalue, ir.rvalue)
        inst_list.append(inst)
        return (curr_addr+1, inst_list)

    def assemble_binary(self, curr_addr, raw_irs):
        # (Binary,)
        inst_list = []
        ir = raw_irs[0]
        code_type = ir.type_str
        code_dict = {"+":"ADD", "-":"SUB", "<":"LT", "-":"SUB", "*":"MUL", "/":"DIV"}
        if code_type in code_dict.keys():
            opcode = code_dict[code_type]
        else:
            raise NotImplementedError("Unsupported code type: {}".format(code_type))
        inst = "{}: {} = {} {} {}".format(hex(curr_addr), ir.lvalue, opcode, ir.variable_left, ir.variable_right)
        inst_list.append(inst)
        return (curr_addr+1, inst_list)

    def assemble_arrayread(self, curr_addr, raw_irs):
        # (Index,)
        inst_list = []
        ir = raw_irs[0]
        inst = "{}: {} = ARRAYREAD {} {}".format(hex(curr_addr), ir.lvalue, ir.variable_left, ir.variable_right)
        inst_list.append(inst)
        return (curr_addr+1, inst_list)

    def assemble_arraywrite(self, curr_addr, raw_irs):
        # (Index, Assignment) / (Index, Binary)
        if isinstance(raw_irs[1], Assignment):
            inst_list = []
            ir0 = raw_irs[0]
            ir1 = raw_irs[1]
            tmp0 = self.get_fresh_tmp_name()
            inst = "{}: {} = ARRAYWRITE {} {} {}".format(hex(curr_addr), tmp0, ir0.variable_left, ir0.variable_right, ir1.rvalue)
            inst_list.append(inst)
            return (curr_addr+1, inst_list)
        elif isinstance(raw_irs[1], Binary):
            # only need to deal with the array-write part
            inst_list = []
            ir0 = raw_irs[0]
            ir1 = raw_irs[1]
            tmp0 = self.get_fresh_tmp_name()
            # (notice) the last format var is *ir1.lvalue* since it's used here as a state variable
            inst = "{}: {} = ARRAYWRITE {} {} {}".format(hex(curr_addr), tmp0, ir0.variable_left, ir0.variable_right, ir1.lvalue)
            inst_list.append(inst)
            return (curr_addr+1, inst_list)
        else:
            raise NotImplementedError("Unsupported irs sequence: {}".format(tuple([type(p) for p in raw_irs])))

    def get_inst_list_by_irs(self, curr_addr, raw_irs):
        seq_irs = tuple([type(p) for p in raw_irs])
        # (notice) currently skipping conditions
        if Condition in seq_irs:
            return curr_addr, []

        if seq_irs==(Assignment,):
            next_addr, inst_list = self.assemble_assignment(curr_addr, raw_irs)
            return next_addr, inst_list
        elif seq_irs==(Binary,):
            next_addr, inst_list = self.assemble_binary(curr_addr, raw_irs)
            return next_addr, inst_list
        elif seq_irs==(Index, Binary):
            if raw_irs[0].lvalue==raw_irs[1].lvalue:
                # first LHS appears in second LHS
                # FIXME: can be map/update
                raise NotImplementedError("not implemented")
            else:
                # first LHS only appears in second RHS
                next_addr, inst_list0 = self.assemble_arrayread(curr_addr, [raw_irs[0]])
                next_addr, inst_list1 = self.assemble_binary(next_addr, [raw_irs[1]])
                return next_addr, inst_list0 + inst_list1
        elif seq_irs==(Index, Assignment):
            if raw_irs[0].lvalue==raw_irs[1].lvalue:
                # first LHS appears in second LHS
                next_addr, inst_list = self.assemble_arraywrite(curr_addr, raw_irs)
                return next_addr, inst_list
            else:
                raise NotImplementedError("not implemented")
        elif seq_irs==(Assignment, Binary):
            next_addr, inst_list0 = self.assemble_assignment(curr_addr, [raw_irs[0]])
            next_addr, inst_list1 = self.assemble_binary(next_addr, [raw_irs[1]])
            return next_addr, inst_list0 + inst_list1
        elif seq_irs==(Index, Index, Assignment):
            if raw_irs[0].lvalue==raw_irs[2].lvalue:
                # first LHS appears in third LHS
                next_addr, inst_list0 = self.assemble_arrayread(curr_addr, [raw_irs[1]])
                next_addr, inst_list1 = self.assemble_arraywrite(next_addr, [raw_irs[0], raw_irs[2]])
                return next_addr, inst_list0 + inst_list1
            else:
                raise NotImplementedError("not implemented")
        elif seq_irs==(Index, Index, Binary):
            if raw_irs[0].lvalue==raw_irs[2].variable_left or raw_irs[0].lvalue==raw_irs[2].variable_right:
                # MAYBE-FIXME: slightly abusive
                # first LHS appears in third LHS
                next_addr, inst_list0 = self.assemble_arrayread(curr_addr, [raw_irs[0]]) # this provides a reference for the Binary
                next_addr, inst_list1 = self.assemble_arrayread(next_addr, [raw_irs[1]])
                next_addr, inst_list2 = self.assemble_binary(next_addr, [raw_irs[2]])
                next_addr, inst_list3 = self.assemble_arraywrite(next_addr, [raw_irs[0], raw_irs[2]])
                return next_addr, inst_list0 + inst_list1 + inst_list2 + inst_list3
            else:
                raise NotImplementedError("not implemented")
        else:
            raise NotImplementedError("Unsupported instruction pattern: {}".format(seq_irs))

    def extract_ir_from_source(self, target_contract):
        slither = Slither(target_contract)
        contract = slither.contracts[0]
        function = contract.functions_declared[0]
        (_, _, _, func_summaries, _) = contract.get_summary()
        (_, _, _, _, read, write, _, _) = func_summaries[0]
        inst_list = []
        address = 0

        for node in function.nodes:

            if len(node.irs)>0:
                address, tmp_inst_list = self.get_inst_list_by_irs(address, node.irs)
                inst_list += tmp_inst_list

        print("# Constructed source contract: ")
        print(inst_list)
        return inst_list, write
