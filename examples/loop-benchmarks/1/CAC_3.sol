
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balanceLocked;
uint i;
address[] _addr;

  function foo() public {
    
for(uint i = 0; i < _addr.length; i++){
balanceLocked[_addr[i]] = 0;
}


  }
}

//#LOOPVARS: i
