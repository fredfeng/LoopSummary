






contract C {
  

  

  uint percentSum;
uint[] _vestingPercents;
uint[] _vestingCommencementDates;

  function foo() public {
    
for(uint32 i = 0; i < _vestingPercents.length; i++){
require(_vestingPercents[i] >= 0);
require(_vestingPercents[i] <= 100);
percentSum = ((percentSum) + (_vestingPercents[i]));
require(_vestingCommencementDates[i] > 0);
if (i > 0) {
require(_vestingCommencementDates[i] > _vestingCommencementDates[i - 1]);
}

}


  }

  

}

//#LOOPVARS: i


