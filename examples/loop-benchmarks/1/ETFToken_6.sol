
pragma solidity ^0.5.10;



contract C {
  

  address token;
TokenInfo[] tokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < tokens.length; i++){
if (tokens[i].addr == token) {
return (tokens[i].tokenUnits, true);
}

}


  }
}

//#LOOPVARS: i

contract TokenInfo { }
