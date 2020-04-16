
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) tokensReceived;
address[] _recipients;
ERC20 token;
uint256 amountOfTokens;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(!tokensReceived[_recipients[i]]);
require(token.transfer(_recipients[i], amountOfTokens));
tokensReceived[_recipients[i]] = true;
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
