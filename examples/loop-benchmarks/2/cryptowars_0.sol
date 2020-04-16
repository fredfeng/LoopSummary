
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => uint) cardPrice;
uint _totalVal;
uint counter;
uint nextAvailableCard;

  function foo() public {
    
while(counter < nextAvailableCard){
_totalVal = SafeMath.add(_totalVal, cardPrice[counter]);
counter = counter + 1;
}

  }
}

//#LOOPVARS: 
