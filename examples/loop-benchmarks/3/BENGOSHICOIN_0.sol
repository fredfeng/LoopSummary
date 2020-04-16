
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => uint256) balanceOf;
uint256 amount;
uint j;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(addresses[j] != 0x0);
balanceOf[addresses[j]] = (balanceOf[addresses[j]]) + (amount);
emit Transfer(msg.sender, addresses[j], amount);
}


  }
}

//#LOOPVARS: j
