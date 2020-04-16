
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
int256 totalExpectedAmounts;
int256[] _expectedAmounts;

  function foo() public {
    
for(uint8 i = 0; i < _expectedAmounts.length; i = (i) + (1)){
require(_expectedAmounts[i] >= 0, "expected amounts should be positive");
totalExpectedAmounts = (totalExpectedAmounts) + (_expectedAmounts[i]);
}


  }
}

//#LOOPVARS: i

contract int256 { }
