






contract C {
  

  

  uint256 freezeDuration;
uint[] rt;
uint _freezeMonth;
uint[] fa;
uint remainAmount;
uint _unfreezeBeginTime;
uint average;

  function foo() public {
    
for(uint i = 0; i < _freezeMonth - 1; i++){
fa[i] = average;
rt[i] = _unfreezeBeginTime;
_unfreezeBeginTime += freezeDuration;
remainAmount = ((remainAmount) - (average));
}


  }

  

}

//#LOOPVARS: i


