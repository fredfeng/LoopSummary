






contract C {
  

  

  uint256[] _tokens;
address[] _addresses;
uint256 tokensSold;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint16 index = 0; index < _addresses.length; index++){
tokensSold = ((tokensSold) + (_tokens[index]));
balances[_addresses[index]] = ((balances[_addresses[index]]) + (_tokens[index]));

}


  }

  

}

//#LOOPVARS: index


