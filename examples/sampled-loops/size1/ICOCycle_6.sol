
pragma solidity ^0.5.10;



contract C {
  

  address[] _arbiters;
mapping(address => mapping(address => bool)) arbiterPool;
uint i;
address _icoRoundAddress;

  function foo() public {
    
for(uint i = 0; i < _arbiters.length; i++){
arbiterPool[_icoRoundAddress][_arbiters[i]] = true;
}


  }
}

//#LOOPVARS: i

contract address => mappingaddress { }
