
pragma solidity ^0.5.10;



contract C {
  

  uint256 grantAmountForEach;
address[] beneficiaries;
uint i;
ERC20Basic token;

  function foo() public {
    
for(uint i = 0; i < beneficiaries.length; i++){
token.safeTransfer(beneficiaries[i], grantAmountForEach);
}


  }
}

//#LOOPVARS: i

contract ERC20Basic { }
