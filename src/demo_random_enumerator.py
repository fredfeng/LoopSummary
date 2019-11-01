#!/usr/bin/env python

from sys import argv
import tyrell.spec as S
from tyrell.interpreter import PostOrderInterpreter
from tyrell.enumerator import RandomEnumerator
from tyrell.decider import Example, SymdiffDecider
from tyrell.synthesizer import Synthesizer
from tyrell.logger import get_logger

logger = get_logger('tyrell')


#COPYRANGE(lockTime[_address], i0, lockNum[_address], tempLockTime, i0, lockNum[address], λ arg: arg+later-earlier)
# for (uint i = 0; i < lockNum[_address]; ++i) {
#   tempLockTime[_address][i] = lockTime[_address][i] + later-earlier;
# }  

toy_spec_str = '''
enum startInt {
  "0"
}

enum address {
    "_address"
}

enum MapArray {
    "lockTime", "tempLockTime"
}

enum MapInt {
    "lockNum"
}

value Inst;
value Stmt;
value Empty;
value endInt;
value Array;

program SymDiff(Stmt) -> Inst;
func addressToArray: Array -> MapArray, address;
func addressToInt: endInt -> MapInt, address;
func COPYRANGE: Inst -> Array, startInt, endInt, Array, startInt, endInt;
'''


class SymDiffInterpreter(PostOrderInterpreter):

    def eval_const(self, node, args):
        return args[0]

    def eval_plus(self, node, args):
        return args[0] + '+' + args[1]

    def eval_minus(self, node, args):
        return args[0] + '-' + args[1]

    def eval_mult(self, node, args):
        return args[0] + '*' + args[1]
    
    def eval_addressToArray(self, node, args):
        return args[0] + '[' + args[1] + ']'

    def eval_addressToInt(self, node, args):
        return args[0] + '[' + args[1] + ']'

    def eval_COPYRANGE(self, node, args):
        
        src_array = args[0]
        start_idx = args[1]
        end_idx = args[2]
        tgt_array = args[3]

        loop_body = """
            for (uint i = {tgtStart}; i < {tgtEnd}; ++i) {{
                {tgtObj}[i] = {srcObj}[i];
            }}
        """.format(tgtStart=start_idx, tgtEnd=end_idx, tgtObj=tgt_array, srcObj=src_array)

        contract_prog = """pragma solidity ^0.5.10;

        contract C {{
            
            mapping (address => uint256[]) private {_storage1};
            mapping (address => uint256[]) private {_storage2};
            mapping (address => uint256) private {_storage3};
            address private {_addr};

            function foo() public {{

                {_body}

            }}
        }}""".format(_body=loop_body, _storage1='lockTime', _storage2='tempLockTime', _storage3='lockNum', _addr='_address')

        print(contract_prog)
        # assert False
        return "done"


def execute(interpreter, prog, args):
    return interpreter.eval(prog, args)


def test_all(interpreter, prog, inputs, outputs):
    return all(
        execute(interpreter, prog, inputs[x]) == outputs[x]
        for x in range(0, len(inputs))
    )


def main(seed=None):
    logger.info('Parsing Spec...')
    spec = S.parse(toy_spec_str)
    logger.info('Parsing succeeded')

    logger.info('Building synthesizer...')
    synthesizer = Synthesizer(
        enumerator=RandomEnumerator(
            spec, max_depth=4, seed=seed),
        decider=SymdiffDecider(
            interpreter=SymDiffInterpreter(),
            examples=[
                # we want to synthesize the program (x-y)*y (depth=3, loc=2)
                # which is also equivalent to x*y-y*y (depth=3, loc=3)
                Example(input=[4, 3], output=3),
            ]
        )
    )
    logger.info('Synthesizing programs...')

    prog = synthesizer.synthesize()
    if prog is not None:
        logger.info('Solution found: {}'.format(prog))
    else:
        logger.info('Solution not found!')


if __name__ == '__main__':
    logger.setLevel('DEBUG')
    seed = None
    if len(argv) > 1:
        try:
            seed = int(argv[1])
        except ValueError:
            pass
    main(seed)
