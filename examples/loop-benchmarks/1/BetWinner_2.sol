
pragma solidity ^0.5.10;



contract C {
  

  Team t;
mapping(address => uint256) payOuts;
uint i;

  function foo() public {
    
for(uint i = 0; i < t.bettors.length; i++){
payOuts[t.bettors[i]] += t.bettorAmount[t.bettors[i]];
}


  }
}

//#LOOPVARS: i

contract Team { }
