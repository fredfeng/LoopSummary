
pragma solidity ^0.5.10;



contract C {
  

  uint32[] _startTimes;
uint len;
uint128[] _maxPurchaseLimits;
uint128[] _minPurchaseLimits;
uint128[] _capRatios;
Stage[] stages;
uint128 cap;
uint32[] _endTimes;
bool[] _kycs;
uint i;
uint coeff;

  function foo() public {
    
for(uint i = 0; i < len; i++){
require(_endTimes[i] >= _startTimes[i]);
uint stageCap;
if (_capRatios[i] != 0) {
stageCap = ((cap) * (uint(_capRatios[i]))) / (coeff);
} else {
stageCap = 0;
}

stages.push(Stage(_startTimes[i], _endTimes[i], uint128(stageCap), _maxPurchaseLimits[i], _minPurchaseLimits[i], _kycs[i], 0));
}


  }
}

//#LOOPVARS: i

contract Stage { }
