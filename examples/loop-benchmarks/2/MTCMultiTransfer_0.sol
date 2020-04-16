
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _balances;
Token token;
address[] _recipients;
uint256 i;
uint airDropped;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(token.transfer(_recipients[i], _balances[i]));
airDropped = (airDropped) + (_balances[i]);
}


  }
}

//#LOOPVARS: i

contract Token { }
