
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
address payee;
mapping(uint8 => address) raceBet;
uint8 betsNum;

  function foo() public {
    
for(uint8 i = 1; i < 7; i++){
if (raceBet[i] == payee) {
raceBet[i] = 0;
betsNum--;
}

}


  }
}

//#LOOPVARS: i
