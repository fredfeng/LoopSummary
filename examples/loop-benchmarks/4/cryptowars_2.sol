
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => address) cardOwner;
mapping(uint => uint) totalCardDivs;
uint counter;
uint nextAvailableCard;
mapping(address => uint) ownerAccounts;
mapping(uint => uint) cardPrice;
uint _distDividends;
uint totalCardValue;

  function foo() public {
    
while(counter < nextAvailableCard){
uint _distAmountLocal = SafeMath.div(SafeMath.mul(_distDividends, cardPrice[counter]), totalCardValue);
ownerAccounts[cardOwner[counter]] = SafeMath.add(ownerAccounts[cardOwner[counter]], _distAmountLocal);
totalCardDivs[counter] = SafeMath.add(totalCardDivs[counter], _distAmountLocal);
counter = counter + 1;
}

  }
}

//#LOOPVARS: 
