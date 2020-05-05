






contract C {
  

  

  mapping(uint => address) cardOwner;
uint _distDividends;
mapping(uint => uint) cardPrice;
mapping(uint => uint) totalCardDivs;
uint nextAvailableCard;
mapping(address => uint) ownerAccounts;
uint totalCardValue;
uint counter;

  function foo() public {
    
while(counter < nextAvailableCard){
uint _distAmountLocal = ((((_distDividends) * (cardPrice[counter]))) / (totalCardValue));
ownerAccounts[cardOwner[counter]] = ((ownerAccounts[cardOwner[counter]]) + (_distAmountLocal));
totalCardDivs[counter] = ((totalCardDivs[counter]) + (_distAmountLocal));
counter = counter + 1;
}

  }

  

}

//#LOOPVARS: i


