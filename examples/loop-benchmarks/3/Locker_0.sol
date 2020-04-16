
pragma solidity ^0.5.10;



contract C {
  

  uint accRatio;
address[] _beneficiaries;
uint i;
uint numBeneficiaries;
uint[] _ratios;
mapping(address => Beneficiary) beneficiaries;

  function foo() public {
    
for(uint i = 0; i < numBeneficiaries; i++){
require(_ratios[i] > 0);
beneficiaries[_beneficiaries[i]].ratio = _ratios[i];
accRatio = (accRatio) + (_ratios[i]);
}


  }
}

//#LOOPVARS: i

contract Beneficiary { }
