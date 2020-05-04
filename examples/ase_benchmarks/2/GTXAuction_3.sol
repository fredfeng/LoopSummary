






contract C {
  

  

  mapping(address => bool) whitelist;
address[] _bidder_addresses;

  function foo() public {
    
for(uint32 i = 0; i < _bidder_addresses.length; i++){
if (_bidder_addresses[i] != address(0) && whitelist[_bidder_addresses[i]] == true) {
whitelist[_bidder_addresses[i]] = false;
}

}


  }

  

}

//#LOOPVARS: i


