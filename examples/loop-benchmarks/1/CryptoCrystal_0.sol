
pragma solidity ^0.5.10;



contract C {
  

  uint256 _sum;
uint256 _totalWeight;
uint256 _yearIndex;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _yearIndex; i++){
_sum = (_sum) + (_totalWeight / (2 ** (i + 1)));
}


  }
}

//#LOOPVARS: i
