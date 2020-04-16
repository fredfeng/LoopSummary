
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
address[] fighterAddressess;
uint8 state;

  function foo() public {
    
for(uint8 i = 0; i < fighterAddressess.length; i++){
Fighter(fighterAddressess[i]).changeState(state);
Fighter(fighterAddressess[i]).transferMoneyToOwner();
}


  }
}

//#LOOPVARS: i
