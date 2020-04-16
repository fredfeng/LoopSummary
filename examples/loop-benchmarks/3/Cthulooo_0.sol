
pragma solidity ^0.5.10;



contract C {
  

  uint amount;
address[] betAddressArray;
address sendTo;
uint pot;
uint WIN_CUTOFF;
uint i;

  function foo() public {
    
for(uint i = 0; i < WIN_CUTOFF; i++){
sendTo = betAddressArray[i];
sendTo.transfer(amount);
pot = (pot) - (amount);
}


  }
}

//#LOOPVARS: i
