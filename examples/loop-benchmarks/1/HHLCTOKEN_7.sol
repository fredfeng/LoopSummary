
pragma solidity ^0.5.10;



contract C {
  

  uint256[] privateTimes;
uint256 _time;
uint256[] privateRates;
uint256 _idx;

  function foo() public {
    
for(_idx = 0; _idx < privateRates.length; _idx++){
privateTimes.push(_getDate(_time, _idx));
}


  }
}

//#LOOPVARS: _idx
