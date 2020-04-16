
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
address token;
TokenInfo[] tokens;

  function foo() public {
    
for(uint8 i = 0; i < tokens.length; i++){
if (tokens[i].addr == token) {
return (tokens[i].tokenUnits, true);
}

}


  }
}

//#LOOPVARS: i

contract TokenInfo { }
