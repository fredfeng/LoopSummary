






contract C {
  

  

  uint256[] _amounts;
address[] _recipients;
uint256 totalAmount;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
totalAmount = ((totalAmount) + (_amounts[i]));
}


  }

  

}

//#LOOPVARS: i


