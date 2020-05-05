






contract C {
  

  

  uint256[] _amounts;
address[] _addresses;
uint256 totalAmount;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
totalAmount = ((totalAmount) + (_amounts[j]));
}


  }

  

}

//#LOOPVARS: j


