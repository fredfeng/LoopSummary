
pragma solidity ^0.5.10;



contract C {
  

  address[] _tos;
uint256[] _amount;
uint256 sum;
uint256 i;

  function foo() public {
    
for(i = 0; i < _amount.length; i++){
sum = (sum) + (_amount[i]);
require(_tos[i] != address(0));
}


  }
}

//#LOOPVARS: i
