
pragma solidity ^0.5.10;



contract C {
  

  uint256 amount;
uint256 len;
uint256 i;
uint256[] _values;

  function foo() public {
    
for(uint256 i = 0; i < len; i = (i) + (1)){
amount = (amount) + (_values[i]);
}


  }
}

//#LOOPVARS: i