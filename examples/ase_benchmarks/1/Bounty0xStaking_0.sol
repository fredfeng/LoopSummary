






contract C {
  

  

  uint totalAmount;
uint[] _amounts;

  function foo() public {
    
for(uint j = 0; j < _amounts.length; j++){
totalAmount = ((totalAmount) + (_amounts[j]));
}


  }

  

}

//#LOOPVARS: j


