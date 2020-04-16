
pragma solidity ^0.5.10;



contract C {
  

  uint256 idx;
uint256[] _engineersCount;
uint256 numberOfEngineer;
PlayerData p;

  function foo() public {
    
for(uint256 idx = 0; idx < numberOfEngineer; idx++){
_engineersCount[idx] = p.engineersCount[idx];
}


  }
}

//#LOOPVARS: idx

contract PlayerData { }
