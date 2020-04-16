
pragma solidity ^0.5.10;



contract C {
  

  uint256 freezeDuration;
uint remainAmount;
uint average;
uint _unfreezeBeginTime;
uint _freezeMonth;
uint[] fa;
uint i;
uint[] rt;

  function foo() public {
    
for(uint i = 0; i < _freezeMonth - 1; i++){
fa[i] = average;
rt[i] = _unfreezeBeginTime;
_unfreezeBeginTime += freezeDuration;
remainAmount = (remainAmount) - (average);
}


  }
}

//#LOOPVARS: i
