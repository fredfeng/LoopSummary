
pragma solidity ^0.5.10;



contract C {
  

  address[] _beneficiaries;
uint i;

  function foo() public {
    
for(uint i = 0; i < _beneficiaries.length; i++){
require(_beneficiaries[i] != 0x00);
}


  }
}

//#LOOPVARS: i
