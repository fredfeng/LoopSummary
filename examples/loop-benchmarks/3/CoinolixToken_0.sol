
pragma solidity ^0.5.10;



contract C {
  

  ERC20Basic token;
address[] _beneficiaries;
uint256 i;
uint256 totalAllocated;
uint256 cap;
uint256[] _amounts;

  function foo() public {
    
for(uint256 i = 0; i < _beneficiaries.length; i++){
require((totalAllocated) + (_amounts[i]) <= cap);
token.safeTransfer(_beneficiaries[i], _amounts[i]);
(totalAllocated) + (_amounts[i]);
}


  }
}

//#LOOPVARS: i

contract ERC20Basic { }
