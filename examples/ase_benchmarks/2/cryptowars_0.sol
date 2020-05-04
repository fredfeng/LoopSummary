






contract C {
  

  

  mapping(uint => uint) cardPrice;
uint nextAvailableCard;
uint _totalVal;
uint counter;

  function foo() public {
    
while(counter < nextAvailableCard){
_totalVal = ((_totalVal) + (cardPrice[counter]));
counter = counter + 1;
}

  }

  

}

//#LOOPVARS: i


