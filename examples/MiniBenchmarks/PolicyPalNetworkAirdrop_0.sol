
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
uint256 totalAmount;
uint256[] _amounts;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
totalAmount = (totalAmount) + (_amounts[i]);
}


  }
}

//#LOOPVARS: i
