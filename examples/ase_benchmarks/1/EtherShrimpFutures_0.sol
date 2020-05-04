






contract C {
  

  

  uint256 poolSum;
address[] farmers;
mapping(address => uint256) lastHatchPrice;

  function foo() public {
    
for(uint i = 0; i < farmers.length; i++){
poolSum = ((lastHatchPrice[farmers[i]]) + (poolSum));
}


  }

  

}

//#LOOPVARS: i


