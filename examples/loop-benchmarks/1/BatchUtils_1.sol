
pragma solidity ^0.5.10;



contract C {
  

  ERC20Basic token;
address[] _receivers;
uint256 value;
uint cnt;
uint i;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
token.transfer(_receivers[i], value);
}


  }
}

//#LOOPVARS: i

contract ERC20Basic { }
