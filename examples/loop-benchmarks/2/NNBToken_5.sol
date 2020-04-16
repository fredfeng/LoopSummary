
pragma solidity ^0.5.10;



contract C {
  

  uint256 sendValue;
uint256 i;
address[] dests;

  function foo() public {
    
while(i < dests.length){
transfer(dests[i], sendValue);
i++;
}

  }
}

//#LOOPVARS: 
