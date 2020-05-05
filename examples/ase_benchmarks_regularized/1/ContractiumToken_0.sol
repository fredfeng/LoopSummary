






contract C {
  

  

  uint256[] _amounts;
uint256 cnt;
uint256 totalAmount;

  function foo() public {
    
for(uint8 i = 0; i < cnt; i++){
totalAmount = ((totalAmount) + (_amounts[i]));
}


  }

  

}

//#LOOPVARS: i


