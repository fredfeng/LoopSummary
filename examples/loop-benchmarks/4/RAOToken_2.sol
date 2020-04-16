
pragma solidity ^0.5.10;



contract C {
  

  uint256[] values;
uint256 i;
uint256 _icoSupply;
address[] tos;
uint256 totalNumberTokenSold;

  function foo() public {
    
for(uint256 i = 0; i < tos.length; i++){
require(_icoSupply >= values[i]);
totalNumberTokenSold = (totalNumberTokenSold) + (values[i]);
_icoSupply = (_icoSupply) - (values[i]);
updateBalances(tos[i], values[i]);
}


  }
}

//#LOOPVARS: i
