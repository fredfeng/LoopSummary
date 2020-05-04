






contract C {
  

  

  uint bet_total_amount;
bytes32 Bets;

  function foo() public {
    
for(uint i = 0; i < 29; i++){
if (Bets[i] == 0x00) continue;

uint bet_amount_ = ((uint(Bets[i])) * (10000000000000000));
bet_total_amount = ((bet_total_amount) + (bet_amount_));
}


  }

  

}

//#LOOPVARS: i


