
pragma solidity ^0.5.10;



contract C {
  

  uint256 BASE_SUPPLY;
uint256[] values;
uint256 i;
address[] dests;

  function foo() public {
    
while(i < dests.length){
uint256 sendValue = values[i] * BASE_SUPPLY;
transfer(dests[i], sendValue);
i++;
}

  }
}

//#LOOPVARS: 
