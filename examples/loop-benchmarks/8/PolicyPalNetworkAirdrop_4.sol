
pragma solidity ^0.5.10;



contract C {
  

  uint256 dropAmount;
address[] _recipients;
PolicyPalNetworkToken token;
uint256 i;
mapping(address => bool) twitterdrops;
uint256 numDrops;
uint256[] _amounts;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
address recipient = _recipients[i];
uint256 amount = _amounts[i];
if (!twitterdrops[recipient]) {
assert(token.transfer(recipient, amount));
twitterdrops[recipient] = true;
numDrops = (numDrops) + (1);
dropAmount = (dropAmount) + (amount);
TokenDrop(recipient, amount, "TWITTER");
}

}


  }
}

//#LOOPVARS: i

contract PolicyPalNetworkToken { }
