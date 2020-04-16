
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
mapping(address => bool) craneList;
uint256 i;
mapping(address => bool) tokensReceived;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(!tokensReceived[_recipients[i]]);
require(!craneList[_recipients[i]]);
craneList[_recipients[i]] = true;
}


  }
}

//#LOOPVARS: i
