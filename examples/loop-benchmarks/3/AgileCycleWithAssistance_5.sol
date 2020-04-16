
pragma solidity ^0.5.10;



contract C {
  

  uint[] _tokenAmounts;
uint totalToken;
uint[] _etherAmounts;
Milestone[] milestones;
uint[] _durations;
uint totalEther;
uint[] _startTimes;
uint i;

  function foo() public {
    
for(uint i = 0; i < _etherAmounts.length; i++){
totalEther = (totalEther) + (_etherAmounts[i]);
totalToken = (totalToken) + (_tokenAmounts[i]);
milestones.push(Milestone(_etherAmounts[i], _tokenAmounts[i], _startTimes[i], 0, _durations[i], "", ""));
}


  }
}

//#LOOPVARS: i

contract Milestone { }
