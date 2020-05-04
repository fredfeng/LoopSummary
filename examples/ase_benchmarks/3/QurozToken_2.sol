






contract C {
  

  

  uint16 i;
address[] _to;
uint256[] _amount;
uint256 amountSum;

  function foo() public {
    
for(i = 0; i < _amount.length; i++){
require(_amount[i] > 0);
require(_to[i] != address(0));
amountSum = ((amountSum) + (_amount[i]));
}


  }

  

}

//#LOOPVARS: i


