
pragma solidity ^0.5.10;



contract C {
  

  uint16 index;
address[] _addresses;
mapping(address => uint256) balances;
uint256[] _tokens;
uint256 tokensSold;

  function foo() public {
    
for(uint16 index = 0; index < _addresses.length; index++){
tokensSold = (tokensSold) + (_tokens[index]);
balances[_addresses[index]] = (balances[_addresses[index]]) + (_tokens[index]);
emit AirDrop(_addresses[index], _tokens[index]);
}


  }
}

//#LOOPVARS: index
