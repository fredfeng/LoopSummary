






contract C {
  

  

  mapping(address => uint256) payments;
uint256 winTax;
uint8 newWinner;
address owner;
mapping(uint8 => address) raceBet;
uint256 gameCost;

  function foo() public {
    
for(uint8 i = 1; i < 7; i++){
if (i != newWinner) {
payments[raceBet[i]] = ((payments[raceBet[i]]) - (gameCost));
payments[raceBet[newWinner]] = ((((payments[raceBet[newWinner]]) + (gameCost))) - (winTax));
payments[owner] = ((payments[owner]) + (winTax));
raceBet[i] = 0;
}

}


  }

  

}

//#LOOPVARS: i


