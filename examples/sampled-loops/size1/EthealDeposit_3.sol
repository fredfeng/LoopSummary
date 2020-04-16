
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _ids;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _ids.length; i++){
refundTransactionInternal(_ids[i]);
}


  }
}

//#LOOPVARS: i
