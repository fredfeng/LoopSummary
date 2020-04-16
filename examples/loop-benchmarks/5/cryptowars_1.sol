
pragma solidity ^0.5.10;



contract C {
  

  uint _cardDistAmount;
uint counter;
uint nextAvailableCard;
uint tempInsurance;
mapping(uint => uint) cardPrice;
mapping(uint => uint) cardInsurance;
uint totalCardValue;

  function foo() public {
    
while(counter < nextAvailableCard){
uint _distAmountLocal = SafeMath.div(SafeMath.mul(_cardDistAmount, cardPrice[counter]), totalCardValue);
cardInsurance[counter] = SafeMath.add(cardInsurance[counter], _distAmountLocal);
tempInsurance = tempInsurance + cardInsurance[counter];
emit onInsuranceChange(0x0, counter, cardInsurance[counter]);
counter = counter + 1;
}

  }
}

//#LOOPVARS: 
