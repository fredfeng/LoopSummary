






contract C {
  

  

  uint256 tokens;
uint256 totalSupply;
uint8 roundNum;
uint256 tokenBase;
uint8[] roundDiscountPercentages;
uint256[] roundCaps;

  function foo() public {
    
while(((tokens) + (totalSupply)) > roundCaps[roundNum] && roundNum < 4){
roundNum++;
tokens = ((tokenBase) * (100)) / (100 - (roundDiscountPercentages[roundNum]));
}

  }

  

}

//#LOOPVARS: i


