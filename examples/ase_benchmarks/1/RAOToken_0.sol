






contract C {
  

  

  mapping(address => bool) whitelist;
address[] listAddresses;
bool status;

  function foo() public {
    
for(uint256 i = 0; i < listAddresses.length; i++){
whitelist[listAddresses[i]] = status;
}


  }

  

}

//#LOOPVARS: i


