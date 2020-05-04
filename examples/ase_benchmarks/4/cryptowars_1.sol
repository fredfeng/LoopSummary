






contract C {
  

  

  uint _cardDistAmount;
uint tempInsurance;
mapping(uint => uint) cardPrice;
uint nextAvailableCard;
uint totalCardValue;
uint counter;
mapping(uint => uint) cardInsurance;

  function foo() public {
    
while(counter < nextAvailableCard){
uint _distAmountLocal = ((((_cardDistAmount) * (cardPrice[counter]))) / (totalCardValue));
cardInsurance[counter] = ((cardInsurance[counter]) + (_distAmountLocal));
tempInsurance = tempInsurance + cardInsurance[counter];
emit 
counter = counter + 1;
}

  }

  

}

//#LOOPVARS: i


