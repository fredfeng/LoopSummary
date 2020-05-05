






contract C {
  

  

  address[] addresses;
uint playerContractCount;
PlayerToken[] playerTokenContracts_;

  function foo() public {
    
for(uint i = 0; i < playerContractCount; i++){
addresses[i] = address(playerTokenContracts_[i]);
}


  }

  

}

//#LOOPVARS: i



contract PlayerToken { }
