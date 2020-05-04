






contract C {
  

  

  uint256[] _amounts;
uint256 len;
uint256 totalAmount;

  function foo() public {
    
for(uint256 i = 0; i < len; i = ((i) + (1))){
totalAmount = ((totalAmount) + (_amounts[i]));
}


  }

  

}

//#LOOPVARS: i


