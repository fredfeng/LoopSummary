
pragma solidity ^0.5.10;



contract C {
  

  uint256 _txFeeDenominator;
uint256[] _txFeeNumerator;
address[] txFeeAddresses;
uint i;
uint256 totalFeesNumerator;

  function foo() public {
    
for(uint i = 0; i < txFeeAddresses.length; i++){
require(txFeeAddresses[i] != address(0));
require(_txFeeNumerator[i] > 0);
require(_txFeeDenominator > _txFeeNumerator[i]);
totalFeesNumerator = (totalFeesNumerator) + (_txFeeNumerator[i]);
}


  }
}

//#LOOPVARS: i
