






contract C {
  

  

  uint8 betsNum;
address payee;
mapping(uint8 => address) raceBet;

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


