






contract C {
  

  

  address[] betArr;
uint8[] jockeyLvl;
mapping(address => uint8) jockeyLevel;
mapping(uint8 => address) raceBet;

  function foo() public {
    
for(uint8 i = 1; i < 7; i++){
jockeyLvl[i - 1] = jockeyLevel[raceBet[i]];
betArr[i - 1] = raceBet[i];
}


  }

  

}

//#LOOPVARS: i


