






contract C {
  

  

  int256[] _expectedAmounts;
int256 totalExpectedAmounts;

  function foo() public {
    
for(uint8 i = 0; i < _expectedAmounts.length; i = ((i) + (1))){
require(_expectedAmounts[i] >= 0, "expected amounts should be positive");
totalExpectedAmounts = ((totalExpectedAmounts) + (_expectedAmounts[i]));
}


  }

  

}

//#LOOPVARS: i


