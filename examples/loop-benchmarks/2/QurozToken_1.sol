
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
mapping(address => uint256) balances;
uint256[] _amount;
uint256 i;

  function foo() public {
    
for(i = 0; i < _to.length; i++){
balances[_to[i]] = (balances[_to[i]]) + (_amount[i]);
emit Transfer(msg.sender, _to[i], _amount[i]);
}


  }
}

//#LOOPVARS: i
