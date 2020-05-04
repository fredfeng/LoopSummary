






contract C {
  

  

  uint256 totalFee;
uint256 chainLength;
uint256[] chainFees;

  function foo() public {
    
for(uint id = 0; id < chainLength; id++){
totalFee = totalFee + chainFees[id];
}


  }

  

}

//#LOOPVARS: id


