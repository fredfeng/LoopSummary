






contract C {
  

  

  mapping(address => bool) mustKyc;
uint len;
address[] _addrs;

  function foo() public {
    
for(uint i; i < len; i++){
delete mustKyc[_addrs[i]];

}


  }

  

}

//#LOOPVARS: i


