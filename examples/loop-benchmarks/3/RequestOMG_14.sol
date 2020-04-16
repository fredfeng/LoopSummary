
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint8 payeesCount;
bytes _requestData;
int256 totalExpectedAmounts;

  function foo() public {
    
for(uint8 i = 0; i < payeesCount; i++){
int256 expectedAmountTemp = int256(Bytes.extractBytes32(_requestData, ((uint256(i)) * (52)) + (61)));
totalExpectedAmounts = (totalExpectedAmounts) + (expectedAmountTemp);
require(expectedAmountTemp > 0, "expected amount should be > 0");
}


  }
}

//#LOOPVARS: i

contract int256 { }
