
pragma solidity ^0.5.10;



contract C {
  

  uint[] _amounts;
uint totalAmount;
uint j;

  function foo() public {
    
for(uint j = 0; j < _amounts.length; j++){
totalAmount = SafeMath.add(totalAmount, _amounts[j]);
}


  }
}

//#LOOPVARS: j
