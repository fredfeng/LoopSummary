
pragma solidity ^0.5.10;



contract C {
  

  uint256 _amount;
mapping(address => uint256) balanceOf;
address[] _addresses;
uint j;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_addresses[j] != address(0));
balanceOf[_addresses[j]] = (balanceOf[_addresses[j]]) + (_amount);
emit Transfer(msg.sender, _addresses[j], _amount);
}


  }
}

//#LOOPVARS: j
