
pragma solidity ^0.5.10;



contract C {
  

  address[] _beneficiaries;
mapping(address => bool) kyclist;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _beneficiaries.length; i++){
kyclist[_beneficiaries[i]] = true;
}


  }
}

//#LOOPVARS: i
