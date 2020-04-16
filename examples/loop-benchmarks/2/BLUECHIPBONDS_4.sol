
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => uint) bondPrice;
uint _totalVal;
uint counter;
uint nextAvailableBond;

  function foo() public {
    
while(counter < nextAvailableBond){
_totalVal = SafeMath.add(_totalVal, bondPrice[counter]);
counter = counter + 1;
}

  }
}

//#LOOPVARS: 
