






contract C {
  

  

  int256[] _expectedAmounts;
int256 totalExpectedAmounts;

  function foo() public {
    
for(uint8 i = 0; i < _expectedAmounts.length; i = ((i) + (1))){
totalExpectedAmounts = ((totalExpectedAmounts) + (_expectedAmounts[i]));
}


  }

  

}

//#LOOPVARS: i


