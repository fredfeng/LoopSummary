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
from slither.slithir.operations.solidity_call import SolidityCall
from slither.slithir.operations.type_conversion import TypeConversion

from slither.slithir.variables.reference import ReferenceVariable
from slither.solc_parsing.variables.state_variable import StateVariableSolc
from slither.solc_parsing.variables.local_variable import LocalVariableSolc
from slither.slithir.variables.temporary import TemporaryVariable

from slither.slithir.variables.constant import Constant



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
        self._ref_counter = -1 # reference variable counter
        self._ckpt_counter = -1 # checkpoint variable counter

        # (notice) apply patch to update Constant method
        self.patch_ir_boolean_0()

        self._verbose = False

        # (debug) see what is the source contract first
        # tmp = self.extract_ir_from_source(self._example)
        # print(tmp)
        # input("DOUBLE-CHECK")

    def patch_ir_boolean_0(self):
        # this patch update the str value of a bool constant in Slither IR
        # where originally it displays "True" but now "true" ("False" but now "false")
        # which corresponds with the MyIR and synthesizer representation
        def new_str(self):
            if isinstance(self.value,bool):
                return str(self.value).lower()
            else:
                return str(self.value)

        Constant.__str__ = new_str

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

    def get_fresh_ckpt_name(self):
        # (important) _ckpt_counter is local to every parsing
        # so it should be reset to -1 before every parsing
        self._ckpt_counter += 1
        return "CKPT_{}".format(self._ckpt_counter)

    def is_equivalent(self, prog):
        '''
        Test the program on all examples provided.
        Return a list of failed examples.
        '''
        candidate_prog = self.interpreter.eval(prog, None)
        if self._verbose:
            print("#### candidate contract ####")
            print(candidate_prog)
        if not self._org_contract:
            print('source contract is empty')
            inst_list, write = self.extract_ir_from_source(self._example)
            self._org_contract = (inst_list, write)

        if self._verbose:
            print("#### source contract ####")
            print(self._org_contract)
        # trigger Bounded Model Checker
        return self._equal_output(candidate_prog, self._org_contract, self._verbose)

    def analyze(self, prog):
        '''
        This basic version of analyze() merely interpret the AST and see if it conforms to our examples
        '''
        if self.is_equivalent(prog):
            return ok()
        else:
            return bad()

    def assemble_arrayread(self, curr_addr, ir):
        inst = "{}: {} = ARRAY-READ {} {}".format( hex(curr_addr), ir.lvalue, ir.variable_left, ir.variable_right )
        return curr_addr+1, [inst]

    def assemble_arraywrite(self, curr_addr, ir0, ir1):
        # ir0: Index, ir1: Assignment/Binary
        assert ir0.lvalue == ir1.lvalue
        if isinstance(ir1, Assignment):
            tmp_0 = self.get_fresh_tmp_name()
            inst = "{}: {} = ARRAY-WRITE {} {} {}".format( hex(curr_addr), tmp_0, ir0.variable_left, ir0.variable_right, ir1.rvalue )
            return curr_addr+1, [inst]
        elif isinstance(ir1, Binary):
            # for the Binary, you need one additional var to store the RHS result

            # process the binary part
            code_type = ir1.type_str
            code_dict = {
                "+":"ADD", "-":"SUB", "*":"MUL", "/":"DIV",
                "<":"LT", "<=":"LTE", ">":"GT", ">=":"GTE",
                "==":"EQ", "!=":"NEQ",
            }
            if code_type in code_dict.keys():
                opcode = code_dict[code_type]
            else:
                raise NotImplementedError("Unsupported code type: {}".format(code_type))
            ref_0 = self.get_fresh_ref_name()
            inst_0 = "{}: {} = {} {} {}".format( hex(curr_addr), ref_0, opcode, ir1.variable_left, ir1.variable_right )

            # process the array-write part
            tmp_1 = self.get_fresh_tmp_name()
            inst_1 = "{}: {} = ARRAY-WRITE {} {} {}".format( hex(curr_addr+1), tmp_1, ir0.variable_left, ir0.variable_right, ref_0 )

            return curr_addr+2, [inst_0, inst_1]
        else:
            raise NotImplementedError("Unsupported ARRAY-WRITE original: {}".format(type(ir1)))

    def assemble_assignment(self, curr_addr, ir):
        inst = "{}: {} = {}".format( hex(curr_addr), ir.lvalue, ir.rvalue )
        return curr_addr+1, [inst]

    def assemble_binary(self, curr_addr, ir):
        # (notice) this binary only write to non-ref var
        # i.e., ir.lvalue is not in ivar_dict
        code_type = ir.type_str
        code_dict = {
            "+":"ADD", "-":"SUB", "*":"MUL", "/":"DIV",
            "<":"LT", "<=":"LTE", ">":"GT", ">=":"GTE",
            "==":"EQ", "!=":"NEQ",
        }
        if code_type in code_dict.keys():
            opcode = code_dict[code_type]
        else:
            raise NotImplementedError("Unsupported code type: {}".format(code_type))
        inst = "{}: {} = {} {} {}".format( hex(curr_addr), ir.lvalue, opcode, ir.variable_left, ir.variable_right )
        return curr_addr+1, [inst]

    def assemble_require(self, curr_addr, ir):
        ckpt_0 = self.get_fresh_ckpt_name()
        inst = "{}: {} = REQUIRE {}".format( hex(curr_addr), ckpt_0, ir.arguments[0] )
        return curr_addr+1, [inst], [ckpt_0]

    def assemble_address(self, curr_addr, ir):
        inst = "{}: {} = {}".format( hex(curr_addr), ir.lvalue, ir.variable )
        return curr_addr+1, [inst]

    # returns: next_addr, inst_list, checkpoint_list
    # checkpoint variable is additional value to verify (currently from `require`)
    # (notice) the checkpoint variable here is modified to the form "CKPT_?" to match the synthesizer
    # assuming that they won't be used anymore (written but not read in the future)
    def get_inst_list_by_irs(self, curr_addr, raw_irs):
        seq_irs = tuple([type(p) for p in raw_irs])

        # (notice) currently skipping conditions
        if Condition in seq_irs:
            return curr_addr, [], []

        # detect for potential array-write operations
        ivar_dict = {}
        next_addr = curr_addr
        final_inst_list = []
        final_ckpt_list = []
        for i in range(len(seq_irs)):
            if seq_irs[i] == Index:
                # LHS is a reference var in the Slither IR
                ivar = raw_irs[i].lvalue
                ivar_dict[ivar] = i # record the LHS
                # then do normal array-read
                next_addr, inst_list = self.assemble_arrayread( next_addr, raw_irs[i] )
                final_inst_list += inst_list
            elif seq_irs[i] == Assignment:
                ivar = raw_irs[i].lvalue
                if ivar in ivar_dict.keys():
                    # array-write
                    j = ivar_dict[ivar]
                    next_addr, inst_list = self.assemble_arraywrite( next_addr, raw_irs[j], raw_irs[i] )
                    final_inst_list += inst_list
                else:
                    # normal assignment
                    next_addr, inst_list = self.assemble_assignment( next_addr, raw_irs[i] )
                    final_inst_list += inst_list
            elif seq_irs[i] ==  Binary:
                ivar = raw_irs[i].lvalue
                if ivar in ivar_dict.keys():
                    # array-write
                    j = ivar_dict[ivar]
                    next_addr, inst_list = self.assemble_arraywrite( next_addr, raw_irs[j], raw_irs[i] )
                    final_inst_list += inst_list
                else:
                    # normal binary
                    next_addr, inst_list = self.assemble_binary( next_addr, raw_irs[i] )
                    final_inst_list += inst_list
            elif seq_irs[i] == SolidityCall:
                fname = raw_irs[i].function.full_name
                if "require" in fname:
                    next_addr, inst_list, ckpt_list = self.assemble_require( next_addr, raw_irs[i] )
                    final_inst_list += inst_list
                    final_ckpt_list += ckpt_list
                else:
                    raise NotImplementedError("Unsupported solidity call: {}".format(fname))
            elif seq_irs[i] == TypeConversion:
                tname = raw_irs[i].type.name
                if "address" in tname:
                    next_addr, inst_list = self.assemble_address( next_addr, raw_irs[i] )
                    final_inst_list += inst_list
                else:
                    raise NotImplementedError("Unsupported type conversion: {}".format(tname))
            else:
                raise NotImplementedError("Unsupported instruction type: {}".format(seq_irs[i]))

        return next_addr, final_inst_list, final_ckpt_list


    def extract_ir_from_source(self, target_contract):
        slither = Slither(target_contract)
        contract = slither.contracts[0]
        function = contract.functions_declared[0]
        (_, _, _, func_summaries, _) = contract.get_summary()
        (_, _, _, _, read, write, _, _) = func_summaries[0]
        inst_list = []
        ckpt_list = []
        address = 0
        self._ckpt_counter = -1 # reset _ckpt_counter

        for node in function.nodes:

            if len(node.irs)>0:
                address, tmp_inst_list, tmp_ckpt_list = self.get_inst_list_by_irs(address, node.irs)
                inst_list += tmp_inst_list
                ckpt_list += tmp_ckpt_list

        # print("------ original ckpt_list: {}".format(ckpt_list))
        # print("------ original write: {}".format(write))
        # input("PAUSE")

        # ckpt_list = list(set(ckpt_list+write)) 
        # FIXME: here we assume we don't verify loop variable "i"
        ckpt_list = list(set(ckpt_list+write)-{"i"})

        # print("# Source Contract: ")
        # print(inst_list)
        # print("# Source Variable to Verify: ")
        # print(ckpt_list)
        # return inst_list, write
        return inst_list, ckpt_list
