
pragma solidity ^0.5.10;



contract C {
  

  uint256 pledgeTotal;
uint16 index;
address[] _addresses;
mapping(address => uint256) pledges;
uint256[] _tokens;

  function foo() public {
    
for(uint16 index = 0; index < _addresses.length; index++){
pledgeTotal = ((pledgeTotal) - (pledges[_addresses[index]])) + (_tokens[index]);
pledges[_addresses[index]] = _tokens[index];
}


  }
}

//#LOOPVARS: index
