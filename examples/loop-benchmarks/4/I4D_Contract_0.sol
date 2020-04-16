
pragma solidity ^0.5.10;



contract C {
  

  uint32 maxlvl;
uint16 cur_level;
address children;
mapping(address => address) rightbrother;

  function foo() public {
    
while(children != 0x0000000000000000000000000000000000000000){
uint32 child_lvl = getMaxLevel(children, cur_level + 1);
if (maxlvl < child_lvl) {
maxlvl = child_lvl;
}

children = rightbrother[children];
}

  }
}

//#LOOPVARS: 
