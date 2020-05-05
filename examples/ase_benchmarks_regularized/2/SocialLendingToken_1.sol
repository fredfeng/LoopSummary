






contract C {
  

  

  uint[] _values;
uint totalAmount;
uint addressCount;

  function foo() public {
    
for(uint i = 0; i < addressCount; i++){
require(_values[i] > 0);
totalAmount = ((totalAmount) + (_values[i]));
}


  }

  

}

//#LOOPVARS: i


