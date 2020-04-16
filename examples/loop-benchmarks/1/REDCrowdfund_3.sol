
pragma solidity ^0.5.10;



contract C {
  

  address[] _batchOfAddresses;
uint256 i;
mapping(address => bool) whiteList;

  function foo() public {
    
for(uint256 i = 0; i < _batchOfAddresses.length; i++){
whiteList[_batchOfAddresses[i]] = true;
}


  }
}

//#LOOPVARS: i
