
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
address owner;
uint256 winTax;
mapping(uint8 => address) raceBet;
uint8 newWinner;
uint256 gameCost;
mapping(address => uint256) payments;

  function foo() public {
    
for(uint8 i = 1; i < 7; i++){
if (i != newWinner) {
payments[raceBet[i]] = (payments[raceBet[i]]) - (gameCost);
payments[raceBet[newWinner]] = ((payments[raceBet[newWinner]]) + (gameCost)) - (winTax);
payments[owner] = (payments[owner]) + (winTax);
raceBet[i] = 0;
}

}


  }
}

//#LOOPVARS: i
