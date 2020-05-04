






contract C {
  

  

  uint256 total;
uint256[] _values;

  function foo() public {
    
for(uint256 i = 0; i < _values.length; i++){
total = ((total) + (_values[i]));
}


  }

  

}

//#LOOPVARS: i


