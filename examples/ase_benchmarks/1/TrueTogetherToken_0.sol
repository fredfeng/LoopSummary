






contract C {
  

  

  address[] _tos;
uint256 i;
uint256 total;
uint256[] _values;

  function foo() public {
    
for(i = 0; i < _tos.length; i++){
total = ((total) + (_values[i]));
}


  }

  

}

//#LOOPVARS: i


