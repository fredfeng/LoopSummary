
pragma solidity ^0.5.10;



contract C {
  

  uint[] vestingCommencementDates;
uint percent;
uint32 i;
uint[] vestingPercents;

  function foo() public {
    
for(uint32 i = 0; i < vestingCommencementDates.length; i++){
if (block.timestamp < vestingCommencementDates[i]) {
} else {
percent += vestingPercents[i];
}

}


  }
}

//#LOOPVARS: i
