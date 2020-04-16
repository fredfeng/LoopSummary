
pragma solidity ^0.5.10;



contract C {
  

  uint256 value;
uint256 toSend;
uint256 i;
address[] dests;

  function foo() public {
    
while(i < dests.length){
sendInternally(dests[i], toSend, value);
i++;
}

  }
}

//#LOOPVARS: 
