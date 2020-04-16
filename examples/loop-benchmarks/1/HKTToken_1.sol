
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalAmount;
uint256[] _amounts;
uint256 len;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < len; i = (i) + (1)){
totalAmount = (totalAmount) + (_amounts[i]);
}


  }
}

//#LOOPVARS: i
