






contract C {
  

  

  mapping(address => bool) mustKyc;
uint len;
address[] _addrs;

  function foo() public {
    
for(uint i = 0; i < len; i++){
delete mustKyc[_addrs[i]];

}


  }

  

}

//#LOOPVARS: i


