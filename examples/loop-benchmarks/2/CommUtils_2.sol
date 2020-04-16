
pragma solidity ^0.5.10;



contract C {
  

  uint256 ans;
uint256 baseStep;
uint256 pow;
uint256 i;
uint256[] array;

  function foo() public {
    
for(uint256 i = 0; i < array.length; i++){
ans = ans + uint256(array[i] * pow);
pow = pow * baseStep;
}


  }
}

//#LOOPVARS: i
