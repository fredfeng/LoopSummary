






contract C {
  

  

  uint256[] _tokens;
mapping(address => uint256) pledges;
address[] _addresses;
uint256 pledgeTotal;

  function foo() public {
    
for(uint16 index = 0; index < _addresses.length; index++){
pledgeTotal = ((((pledgeTotal) - (pledges[_addresses[index]]))) + (_tokens[index]));
pledges[_addresses[index]] = _tokens[index];
}


  }

  

}

//#LOOPVARS: index


