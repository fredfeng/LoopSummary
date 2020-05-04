






contract C {
  

  

  uint256 pow;
uint256[] array;
uint256 baseStep;
uint256 ans;

  function foo() public {
    
for(uint256 i = 0; i < array.length; i++){
ans = ans + uint256(array[i] * pow);
pow = pow * baseStep;
}


  }

  

}

//#LOOPVARS: i


