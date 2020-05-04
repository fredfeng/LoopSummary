






contract C {
  

  

  uint256[] _amountOfLands;
uint256 Factor;
uint256 totalAmount;

  function foo() public {
    
for(uint256 i; i < _amountOfLands.length; i++){
uint256 amount = ((_amountOfLands[i]) * (Factor));
totalAmount = ((totalAmount) + (amount));
}


  }

  

}

//#LOOPVARS: i


