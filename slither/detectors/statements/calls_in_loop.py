"""
"""
from slither.core.cfg.node import NodeType
from slither.detectors.abstract_detector import (AbstractDetector,
                                                 DetectorClassification)
from slither.slithir.operations import (HighLevelCall, LibraryCall, Call,
                                        LowLevelCall, Send, Transfer)
from slither.slithir.operations.condition import Condition
from slither.analyses.data_dependency.data_dependency import is_tainted
from slither.analyses.data_dependency.data_dependency import is_dependent



class MultipleCallsInLoop(AbstractDetector):
    """
    """

    ARGUMENT = 'calls-loop'
    HELP = 'Multiple calls in a loop'
    IMPACT = DetectorClassification.LOW
    CONFIDENCE = DetectorClassification.MEDIUM

    WIKI = 'https://github.com/crytic/slither/wiki/Detector-Documentation/_edit#calls-inside-a-loop'


    WIKI_TITLE = 'Calls inside a loop'
    WIKI_DESCRIPTION = 'Calls inside a loop might lead to denial of service attack.'
    WIKI_EXPLOIT_SCENARIO = '''
```solidity
contract CallsInLoop{

    address[] destinations;

    constructor(address[] newDestinations) public{
        destinations = newDestinations;
    }

    function bad() external{
        for (uint i=0; i < destinations.length; i++){
            destinations[i].transfer(i);
        }
    }

}
```
If one of the destinations has a fallback function which reverts, `bad` will always revert.'''

    WIKI_RECOMMENDATION = 'Favor [pull over push](https://github.com/ethereum/wiki/wiki/Safety#favor-pull-over-push-for-external-calls) strategy for external calls.'

    @staticmethod
    def call_in_loop(f, node, in_loop, visited, ret, loopsum):
        if node in visited:
            return
        # shared visited
        visited.append(node)

        if node.type == NodeType.STARTLOOP:
            loopsum.append('hasloop')
            # print('>>>>>>>>>>>>>begin loop')
            in_loop = True
            # is_tainted_by_arg, is_tainted_by_statevar, is_tained_by_local, has_transaction, has_lib_call, has_nested_loop = MultipleCallsInLoop.collect_summary(node, f)
            # print('Loop Summary----', 'has_nested_loop:', has_nested_loop, 'has_lib_call:', has_lib_call, 'has_transaction:', has_transaction, 
            #             'is_tained_by_local:', is_tained_by_local, 'is_tainted_by_arg:', is_tainted_by_arg, 'is_tainted_by_statevar:', is_tainted_by_statevar )

        elif node.type == NodeType.ENDLOOP:
            # print('<<<<<<<<<<<<<exit loop')
            in_loop = False

        if in_loop:
            has_nested_loop = any((son.type == NodeType.STARTLOOP) for son in node.sons)
            if has_nested_loop:
                loopsum.append('nested_loop')
            for ir in node.irs:
                if isinstance(ir, (LowLevelCall,
                                    HighLevelCall,
                                    Send,
                                    Transfer)):
                    if isinstance(ir, LibraryCall):
                        has_lib_call = True
                        loopsum.append('lib_call')
                    else: 
                        has_transaction = True
                        loopsum.append('transaction')


                if isinstance(ir, Condition):
                    is_tainted_by_arg = is_tainted(ir.value, f)
                    is_tainted_by_statevar = any(is_dependent(ir.value, t, f) for t in f.contract.state_variables)
                    is_tained_by_local = not (is_tainted_by_arg or is_tainted_by_statevar)
                    # print(is_tainted_by_arg, is_tainted_by_statevar, is_tained_by_local, node, type(node))
                    if is_tainted_by_arg:
                        loopsum.append('tainted_by_arg')
                    if is_tainted_by_statevar:
                        loopsum.append('tainted_by_statevar')
                    if is_tained_by_local:
                        loopsum.append('tained_by_local')


        for son in node.sons:
            MultipleCallsInLoop.call_in_loop(f, son, in_loop, visited, ret, loopsum)

    @staticmethod
    def detect_call_in_loop(contract):
        ret = []
        for f in contract.functions + contract.modifiers:
            if f.contract_declarer == contract and f.is_implemented:
                loopsum = []
                MultipleCallsInLoop.call_in_loop(f, f.entry_point,
                                                 False, [], ret, loopsum)

                has_nested_loop = 'nested_loop' in loopsum
                has_lib_call = 'lib_call' in loopsum
                has_transaction = 'transaction' in loopsum
                is_tained_by_local = 'tained_by_local' in loopsum
                is_tainted_by_arg = 'tainted_by_arg' in loopsum
                is_tainted_by_statevar = 'tainted_by_statevar' in loopsum
                if len(loopsum) > 1:
                    print('Loop Summary----', f, 'has_nested_loop:', has_nested_loop, 'has_lib_call:', has_lib_call, 'has_transaction:', has_transaction, 
                        'is_tained_by_local:', is_tained_by_local, 'is_tainted_by_arg:', is_tainted_by_arg, 'is_tainted_by_statevar:', is_tainted_by_statevar )

        return ret

    def _detect(self):
        """
        """
        results = []
        for c in self.slither.contracts_derived:
            values = self.detect_call_in_loop(c)
            for node in values:
                func = node.function

                info = "{} has external calls inside a loop: \"{}\" ({})\n"
                info = info.format(func.canonical_name, node.expression, node.source_mapping_str)

                json = self.generate_json_result(info)
                self.add_node_to_json(node, json)
                results.append(json)

        if len(results) > 0:
            print("current contract has loop!")

        return results
