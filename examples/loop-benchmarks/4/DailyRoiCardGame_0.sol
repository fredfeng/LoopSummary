
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => address) cardOwner;
uint precisionFactor;
uint _card;
mapping(uint => uint) totalCardDivs;
mapping(address => uint) ownerAccounts;
uint totalCards;
uint _distDividends;
uint totalCardValue;
mapping(uint => uint) cardPreviousPrice;

  function foo() public {
    
for(uint _card = 0; _card < totalCards; _card++){
uint _divShare = SafeMath.div(SafeMath.div(SafeMath.mul(cardPreviousPrice[_card], 10 ** (precisionFactor + 1)), totalCardValue) + 5, 10);
uint _cardDivs = SafeMath.div(SafeMath.mul(_distDividends, _divShare), 10 ** precisionFactor);
ownerAccounts[cardOwner[_card]] += _cardDivs;
totalCardDivs[_card] = SafeMath.add(totalCardDivs[_card], _cardDivs);
}


  }
}

//#LOOPVARS: _card
