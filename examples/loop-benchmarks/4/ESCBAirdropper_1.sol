
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalClaimed;
mapping(address => bool) tokensReceived;
address[] _recipients;
ERC20 token;
uint256 i;
uint256[] _amount;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(!tokensReceived[_recipients[i]]);
require(token.transfer(_recipients[i], _amount[i]));
tokensReceived[_recipients[i]] = true;
totalClaimed = (totalClaimed) + (_amount[i]);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
