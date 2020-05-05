






contract C {
  

  

  mapping(address => bool) canRecieveTokens;
address[] _addresses;

  function foo() public {
    
for(uint256 i = 0; i < _addresses.length; i++){
canRecieveTokens[_addresses[i]] = true;
}


  }

  

}

//#LOOPVARS: i


