
pragma solidity ^0.5.10;



contract C {
  

  address[] _addresses;
mapping(address => bool) frozenAccount;
uint256 _amount;
uint j;
mapping(address => uint256) balanceOf;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_addresses[j] != 0x0 && frozenAccount[_addresses[j]] == false);
balanceOf[_addresses[j]] = (balanceOf[_addresses[j]]) + (_amount);
Transfer(msg.sender, _addresses[j], _amount);
}


  }
}

//#LOOPVARS: j
