






contract C {
  

  

  mapping(address => bool) whitelist;
address[] _addrs;

  function foo() public {
    
for(uint8 i = 0; i < _addrs.length; i++){
if (!whitelist[_addrs[i]]) {
whitelist[_addrs[i]] = true;
}

}


  }

  

}

//#LOOPVARS: i


