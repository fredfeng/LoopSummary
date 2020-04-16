
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
uint256[] tokenUnits;
TokenInfo[] tokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
tokens.push(TokenInfo(addresses[i], tokenUnits[i]));
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }
