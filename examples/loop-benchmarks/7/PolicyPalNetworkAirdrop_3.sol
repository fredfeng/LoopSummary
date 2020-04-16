
pragma solidity ^0.5.10;



contract C {
  

  uint256 dropAmount;
address[] _recipients;
PolicyPalNetworkToken token;
uint256 _amount;
uint256 i;
mapping(address => bool) twitterdrops;
uint256 numDrops;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
address recipient = _recipients[i];
if (!twitterdrops[recipient]) {
assert(token.transfer(recipient, _amount));
twitterdrops[recipient] = true;
numDrops = (numDrops) + (1);
dropAmount = (dropAmount) + (_amount);
TokenDrop(recipient, _amount, "TWITTER");
}

}


  }
}

//#LOOPVARS: i

contract PolicyPalNetworkToken { }
