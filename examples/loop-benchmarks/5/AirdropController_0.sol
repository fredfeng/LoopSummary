
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) tokenReceived;
address[] _recipients;
ERC20 token;
uint totalClaimed;
uint[] _amounts;
uint i;

  function foo() public {
    
for(uint i = 0; i < _recipients.length; i++){
require(_recipients[i] != address(0));
require(tokenReceived[_recipients[i]] == false);
require(token.transfer(_recipients[i], _amounts[i]));
tokenReceived[_recipients[i]] = true;
totalClaimed = (totalClaimed) + (_amounts[i]);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
