
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalAmount;
uint256[] _amounts;
address[] _addresses;
uint j;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
totalAmount = (totalAmount) + (_amounts[j]);
}


  }
}

//#LOOPVARS: j
