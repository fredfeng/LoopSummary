
pragma solidity ^0.5.10;



contract C {
  

  uint i;
uint[] values;
address[] dests;

  function foo() public {
    
while(i < dests.length){
mint(dests[i], values[i]);
i += 1;
}

  }
}

//#LOOPVARS: 
