
pragma solidity ^0.5.10;



contract C {
  

  address[] farmers;
uint256 poolSum;
uint i;
mapping(address => uint256) lastHatchPrice;

  function foo() public {
    
for(uint i = 0; i < farmers.length; i++){
poolSum = SafeMath.add(lastHatchPrice[farmers[i]], poolSum);
}


  }
}

//#LOOPVARS: i
