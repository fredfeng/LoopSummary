
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => uint256) balanceOf;
bool cannotReceive;
uint256 amount;
uint i;
uint256 cannotReceiveUntil;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(addresses[i] != address(0) && cannotReceive[addresses[i]] == false && now > cannotReceiveUntil[addresses[i]]);
balanceOf[addresses[i]] = (balanceOf[addresses[i]]) + (amount);
emit Transfer(msg.sender, addresses[i], amount);
}


  }
}

//#LOOPVARS: i
