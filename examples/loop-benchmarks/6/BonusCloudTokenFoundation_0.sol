
pragma solidity ^0.5.10;



contract C {
  

  uint[] _vestingCommencementDates;
uint32 i;
uint[] _vestingPercents;
uint percentSum;

  function foo() public {
    
for(uint32 i = 0; i < _vestingPercents.length; i++){
require(_vestingPercents[i] >= 0);
require(_vestingPercents[i] <= 100);
percentSum = (percentSum) + (_vestingPercents[i]);
require(_vestingCommencementDates[i] > 0);
if (i > 0) {
require(_vestingCommencementDates[i] > _vestingCommencementDates[i - 1]);
}

}


  }
}

//#LOOPVARS: i
