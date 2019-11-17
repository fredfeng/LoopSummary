from slither import Slither
from analysis import is_dependent, pprint_dependency, compute_dependency_contract


slither = Slither('data_dependency_simple_example.sol')

myContract = slither.get_contract_from_name('MyContract')
funcA = myContract.get_function_from_signature('foo()')
# funcA = myContract.get_function_from_signature('setA(uint256)')
# input_a = funcA.parameters[0]

a = myContract.get_state_variable_from_name('a')
b = myContract.get_state_variable_from_name('b')
c = myContract.get_state_variable_from_name('c')
d = myContract.get_state_variable_from_name('d')

compute_dependency_contract(myContract, slither)
pprint_dependency(funcA)

# print(f'{b.name} is dependant from {input_a.name}?: {is_dependent(b, a, funcA)}')
# print(f'{b.name} is dependant from {input_a.name}?: {is_dependent(b, a, myContract)}')
