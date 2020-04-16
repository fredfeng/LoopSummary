
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
PlayerToken[] playerTokenContracts_;
uint i;
uint playerContractCount;

  function foo() public {
    
for(uint i = 0; i < playerContractCount; i++){
addresses[i] = address(playerTokenContracts_[i]);
}


  }
}

//#LOOPVARS: i

contract PlayerToken { }
