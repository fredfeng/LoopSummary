
pragma solidity ^0.5.10;



contract C {
  

  address[] addrs;
uint256 i;
bool[] whitelisted;

  function foo() public {
    
for(uint256 i = 0; i < addrs.length; i++){
assert(setAMLWhitelisted(addrs[i], whitelisted[i]));
}


  }
}

//#LOOPVARS: i
