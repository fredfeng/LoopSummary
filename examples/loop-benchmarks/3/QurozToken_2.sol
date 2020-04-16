
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
uint256 amountSum;
uint256[] _amount;
uint16 i;

  function foo() public {
    
for(i = 0; i < _amount.length; i++){
require(_amount[i] > 0);
require(_to[i] != address(0));
amountSum = (amountSum) + (_amount[i]);
}


  }
}

//#LOOPVARS: i
