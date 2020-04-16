
pragma solidity ^0.5.10;



contract C {
  

  Stage[] stages;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < stages.length; i++){
if (stages[i].closed == 0) {
return i;
}

}


  }
}

//#LOOPVARS: i

contract Stage { }
