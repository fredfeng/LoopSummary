
pragma solidity ^0.5.10;



contract C {
  

  address[] investors;
uint length;
uint startIndex;
uint i;

  function foo() public {
    
for(uint i = startIndex; i < length; i++){
payWithdraw(investors[i]);
}


  }
}

//#LOOPVARS: i
