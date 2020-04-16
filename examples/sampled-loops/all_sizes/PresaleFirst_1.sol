
pragma solidity ^0.5.10;



contract C {
  

  address[] addrs;
bool success;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < addrs.length; i++){
if (removeAddressFromWhitelist(addrs[i])) {
success = true;
}

}


  }
}

//#LOOPVARS: i
