
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256[] tokenUnits;
TokenInfo[] tokens;
address[] addresses;

  function foo() public {
    
for(uint8 i = 0; i < addresses.length; i++){
tokens.push(TokenInfo(addresses[i], tokenUnits[i]));
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }
