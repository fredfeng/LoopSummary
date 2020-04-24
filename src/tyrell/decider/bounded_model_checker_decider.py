from typing import Callable, NamedTuple, List, Any
from tyrell.decider.decider import Decider
from tyrell.interpreter import Interpreter
from tyrell.decider.result import ok, bad
from slither import Slither
from slither.slithir.operations.assignment import Assignment
from slither.slithir.operations.binary import Binary
from slither.slithir.operations.index import Index

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

    @property
    def interpreter(self):
        return self._interpreter

    @property
    def example(self):
        return self._example

    @property
    def equal_output(self):
        return self._equal_output

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
        print(candidate_prog)
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

    def extract_ir_from_source(self, target_contract):
        slither = Slither(target_contract)
        contract = slither.contracts[0]
        function = contract.functions_declared[0]
        (_, _, _, func_summaries, _) = contract.get_summary()
        (_, _, _, _, read, write, _, _) = func_summaries[0]
        inst_list = []
        address = 0

        for node in function.nodes:
            if node.irs:
                for ir in node.irs:
                    if isinstance(ir, Assignment):
                        address = address + 1
                        inst =  '{}: {} = {}'.format(hex(address), ir.lvalue, ir.rvalue)
                        inst_list.append(inst)
                    elif isinstance(ir, Index):
                        address = address + 1
                        inst =  "{}: {} = ARRAYACCESS {} {}".format(hex(address), ir.lvalue, ir.variable_left, ir.variable_right)
                        inst_list.append(inst)
                    elif isinstance(ir, Binary):
                        address = address + 1
                        inst = ''
                        opcode = 'no-op'
                        code_type = ir.type_str
                        if code_type == '+':
                            opcode = 'ADD'
                        elif code_type == '-':
                            opcode = 'SUB'
                        elif code_type == '<':
                            opcode = 'LT'  
                        else:
                            pass                     

                        inst = '{}: {} = {} {} {}'.format(hex(address), str(ir.lvalue), opcode, ir.variable_left, ir.variable_right)
                        inst_list.append(inst)

                    else:
                        pass

        return inst_list, write
