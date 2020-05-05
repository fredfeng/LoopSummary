






contract C {
  

  

  uint total;
uint[] _values;

  function foo() public {
    
for(uint i = 0; i < _values.length; i++){
total = ((total) + (_values[i]));
}


  }

  

}

//#LOOPVARS: i


