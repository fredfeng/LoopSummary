
pragma solidity ^0.5.10;



contract C {
  

  address _from;
mapping(address => uint256) balances;
address[] _tos;
uint256[] _values;
uint i;

  function foo() public {
    
for(uint i; i < _tos.length; i++){
balances[_from] = (balances[_from]) - (_values[i]);
balances[_tos[i]] = (balances[_tos[i]]) + (_values[i]);
Transfer(_from, _tos[i], _values[i]);
}


  }
}

//#LOOPVARS: i
