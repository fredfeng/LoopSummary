
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
Stage[] stages;

  function foo() public {
    
for(uint8 i = 0; i < stages.length - 1; i++){
if (stages[i].endTime >= stages[i + 1].startTime) {
return false;
}

}


  }
}

//#LOOPVARS: i

contract Stage { }
