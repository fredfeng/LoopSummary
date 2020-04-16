
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(uint8 => address) raceBet;
uint8[] jockeyLvl;
address[] betArr;
mapping(address => uint8) jockeyLevel;

  function foo() public {
    
for(uint8 i = 1; i < 7; i++){
jockeyLvl[i - 1] = jockeyLevel[raceBet[i]];
betArr[i - 1] = raceBet[i];
}


  }
}

//#LOOPVARS: i
