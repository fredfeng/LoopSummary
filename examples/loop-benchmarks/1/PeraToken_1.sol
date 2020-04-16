
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _amount;
address[] _tos;
uint256 i;

  function foo() public {
    
for(i = 0; i < _tos.length; i++){
transfer(_tos[i], _amount[i]);
}


  }
}

//#LOOPVARS: i
