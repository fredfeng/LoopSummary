
pragma solidity ^0.5.10;



contract C {
  

  uint from;
uint[] transactionIdsTemp;
uint to;
uint[] _transactionIds;
uint i;

  function foo() public {
    
for(i = from; i < to; i++){
_transactionIds[i - from] = transactionIdsTemp[i];
}


  }
}

//#LOOPVARS: i
