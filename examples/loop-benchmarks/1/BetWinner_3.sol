
pragma solidity ^0.5.10;



contract C {
  

  Team t2;
mapping(address => uint256) payOuts;
uint i;

  function foo() public {
    
for(i = 0; i < t2.bettors.length; i++){
payOuts[t2.bettors[i]] += t2.bettorAmount[t2.bettors[i]];
}


  }
}

//#LOOPVARS: i

contract Team { }
