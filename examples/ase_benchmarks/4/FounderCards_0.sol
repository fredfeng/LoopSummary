






contract C {
  

  

  uint totalCards;
mapping(uint => address) cardOwner;
uint _distDividends;
mapping(uint => uint) totalCardDivs;
mapping(address => uint) ownerAccounts;
uint precisionFactor;
mapping(uint => uint) cardPreviousPrice;
uint totalCardValue;

  function foo() public {
    
for(uint _card = 0; _card < totalCards; _card++){
uint _divShare = ((((((cardPreviousPrice[_card]) * (10 ** (precisionFactor + 1)))) / (totalCardValue)) + 5) / (10));
uint _cardDivs = ((((_distDividends) * (_divShare))) / (10 ** precisionFactor));
ownerAccounts[cardOwner[_card]] += _cardDivs;
totalCardDivs[_card] = ((totalCardDivs[_card]) + (_cardDivs));
}


  }

  

}

//#LOOPVARS: _card


