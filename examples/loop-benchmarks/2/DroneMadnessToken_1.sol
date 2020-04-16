
pragma solidity ^0.5.10;



contract C {
  

  ERC20Basic token;
address[] _beneficiaries;
uint256 i;
uint256 _amounts;
uint256 totalAllocated;

  function foo() public {
    
for(uint256 i = 0; i < _beneficiaries.length; i++){
token.safeTransfer(_beneficiaries[i], _amounts);
(totalAllocated) + (_amounts);
}


  }
}

//#LOOPVARS: i

contract ERC20Basic { }
