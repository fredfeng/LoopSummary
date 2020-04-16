
pragma solidity ^0.5.10;



contract C {
  

  uint256[] values;
uint256 decimals;
uint256 i;
address[] dests;

  function foo() public {
    
while(i < dests.length){
uint256 toSend = (values[i]) * (10 ** decimals);
sendInternally(dests[i], toSend, values[i]);
i++;
}

  }
}

//#LOOPVARS: 
