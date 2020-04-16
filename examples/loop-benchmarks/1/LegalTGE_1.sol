
pragma solidity ^0.5.10;



contract C {
  

  uint teamBonusBps;
uint i;
TeamBonus[] teamBonuses;

  function foo() public {
    
for(uint i = 0; i < teamBonuses.length; i++){
teamBonusBps = (teamBonusBps) + (teamBonuses[i].tokenBps);
}


  }
}

//#LOOPVARS: i

contract TeamBonus { }
