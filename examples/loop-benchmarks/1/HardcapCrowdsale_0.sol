
pragma solidity ^0.5.10;



contract C {
  

  address[] _beneficiaries;
uint i;
uint256[] _tokensAmount;

  function foo() public {
    
for(uint i = 0; i < _tokensAmount.length; i++){
_processTokensAssgin(_beneficiaries[i], _tokensAmount[i]);
}


  }
}

//#LOOPVARS: i
