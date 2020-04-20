
pragma solidity ^0.5.10;



contract C {
  

  uint256 cnt;
uint256 totalAmount;
uint256[] _amounts;
uint8 i;

  function foo() public {
    
for(uint8 i = 0; i < cnt; i++){
totalAmount = (totalAmount) + (_amounts[i]);
}


  }
}

//#LOOPVARS: i
