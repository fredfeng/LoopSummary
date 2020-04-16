
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) whitelist;
address[] _beneficiaries;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _beneficiaries.length; i++){
whitelist[_beneficiaries[i]] = true;
}


  }
}

//#LOOPVARS: i
