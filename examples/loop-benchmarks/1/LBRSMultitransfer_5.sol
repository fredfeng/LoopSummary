
pragma solidity ^0.5.10;



contract C {
  

  LibertyToken token;
uint256[] balance;
address[] recipient;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < recipient.length; i++){
token.transfer(recipient[i], balance[i]);
}


  }
}

//#LOOPVARS: i

contract LibertyToken { }
