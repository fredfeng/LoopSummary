
pragma solidity ^0.5.10;



contract C {
  

  uint[] _dates;
DiscountStruct[] discountStructs;
uint j;

  function foo() public {
    
for(uint j = 0; j < discountStructs.length; j++){
require(_dates[0] > discountStructs[j].fromDate || _dates[1] < discountStructs[j].toDate);
}


  }
}

//#LOOPVARS: j

contract DiscountStruct { }
