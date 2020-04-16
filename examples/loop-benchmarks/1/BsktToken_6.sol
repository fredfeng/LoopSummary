
pragma solidity ^0.5.10;



contract C {
  

  address token;
TokenInfo[] tokens;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < tokens.length; i++){
if (tokens[i].addr == token) {
return (tokens[i].quantity, true);
}

}


  }
}

//#LOOPVARS: i

contract TokenInfo { }
