
pragma solidity ^0.5.10;



contract C {
  

  uint32 i;
mapping(address => bool) kycDone;
address[] _customerAddrs;

  function foo() public {
    
for(uint32 i = 0; i < _customerAddrs.length; ++i){
kycDone[_customerAddrs[i]] = true;
RegisterKYC(_customerAddrs[i]);
}


  }
}

//#LOOPVARS: i
