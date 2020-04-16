
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
TokenInfo[] tokens;
uint256[] quantities;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < addresses.length; i++){
tokens.push(TokenInfo(addresses[i], quantities[i]));
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }
