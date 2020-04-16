
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _to.length; i++){
release(_to[i]);
}


  }
}

//#LOOPVARS: i
