
pragma solidity ^0.5.10;



contract C {
  

  uint[] amounts;
address[] addresses;
mapping(address => uint256) balanceOf;
bool cannotReceive;
uint256 totalAmount;
uint i;
uint256 cannotReceiveUntil;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(amounts[i] > 0 && addresses[i] != address(0) && cannotReceive[addresses[i]] == false && now > cannotReceiveUntil[addresses[i]]);
amounts[i] = (amounts[i]) * (1e8);
balanceOf[addresses[i]] = (balanceOf[addresses[i]]) + (amounts[i]);
totalAmount = (totalAmount) + (amounts[i]);
emit Transfer(msg.sender, addresses[i], amounts[i]);
}


  }
}

//#LOOPVARS: i
