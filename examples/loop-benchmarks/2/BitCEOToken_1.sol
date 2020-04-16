
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 cnt;
mapping(address => uint256) balances;
address[] _receivers;
uint256[] _amounts;

  function foo() public {
    
for(i = 0; i < cnt; i++){
balances[_receivers[i]] = (balances[_receivers[i]]) + (_amounts[i]);
emit Transfer(msg.sender, _receivers[i], _amounts[i]);
}


  }
}

//#LOOPVARS: i
