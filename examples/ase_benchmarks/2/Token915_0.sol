






contract C {
  

  

  uint256[] _value;
uint256 balanceOfSender;
uint256 amount;
uint256 len;

  function foo() public {
    
for(uint256 j; j < len; j++){
require(_value[j] <= balanceOfSender);
amount = ((amount) + (_value[j]));
}


  }

  

}

//#LOOPVARS: j


