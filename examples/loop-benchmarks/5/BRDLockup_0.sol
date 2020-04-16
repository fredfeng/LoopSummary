
pragma solidity ^0.5.10;



contract C {
  

  uint _allocationsIndex;
uint256 currentInterval;
uint256 numIntervals;
Allocation[] allocations;
uint _i;

  function foo() public {
    
for(uint _i = 0; _i < _allocationsIndex; _i++){
uint256 _amountToReward;
if (currentInterval == numIntervals) {
_amountToReward = allocations[_i].remainingBalance;
} else {
_amountToReward = (allocations[_i].allocation) / (numIntervals);
}

allocations[_i].currentReward = _amountToReward;
}


  }
}

//#LOOPVARS: _i

contract Allocation { }
