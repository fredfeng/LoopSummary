
pragma solidity ^0.5.10;



contract C {
  

  uint256[] airdropRates;
uint256 _time;
uint256[] airdropTimes;
uint256 _idx;

  function foo() public {
    
for(_idx = 0; _idx < airdropRates.length; _idx++){
airdropTimes.push(_getDate(_time, _idx));
}


  }
}

//#LOOPVARS: _idx
