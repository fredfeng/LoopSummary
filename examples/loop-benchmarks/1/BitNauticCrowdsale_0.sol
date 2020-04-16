
pragma solidity ^0.5.10;



contract C {
  

  address[] addrs;
uint8[] levels;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < addrs.length; i++){
assert(setKYCLevel(addrs[i], levels[i]));
}


  }
}

//#LOOPVARS: i
