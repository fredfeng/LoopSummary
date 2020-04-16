
pragma solidity ^0.5.10;



contract C {
  

  uint256 FIELD_ORDER;
uint256 y;
uint256 x;
uint256 beta;

  function foo() public {
    
while(true){
(beta, y) = findYforX(x);
if (beta == mulmod(y, y, FIELD_ORDER)) {
return Point(x, y);
}

x = addmod(x, 1, FIELD_ORDER);
}

  }
}

//#LOOPVARS: 
