
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint count;
address[] _tos;
uint256[] _values;
uint i;

  function foo() public {
    
for(i = 0; i < count; i++){
balances[msg.sender] = SafeMath.sub(balances[msg.sender], _values[i]);
balances[_tos[i]] = SafeMath.add(balances[_tos[i]], _values[i]);
Transfer(msg.sender, _tos[i], _values[i]);
}


  }
}

//#LOOPVARS: i
