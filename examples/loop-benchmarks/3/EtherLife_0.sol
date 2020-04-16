
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
address[] refLevels;
mapping(address => address) parents;
address current;

  function foo() public {
    
for(uint8 i = 0; i < 5; i++){
current = parents[current];
if (current == address(0)) break;

refLevels[i] = current;
}


  }
}

//#LOOPVARS: i
