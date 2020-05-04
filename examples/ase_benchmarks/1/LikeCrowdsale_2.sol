






contract C {
  

  

  mapping(address => bool) kycDone;
address[] _customerAddrs;

  function foo() public {
    
for(uint32 i = 0; i < _customerAddrs.length; ++i){
kycDone[_customerAddrs[i]] = true;

}


  }

  

}

//#LOOPVARS: i


