
pragma solidity ^0.5.10;



contract C {
  

  uint256 dropAmount;
address[] _recipients;
mapping(address => bool) signaturedrops;
PolicyPalNetworkToken token;
uint256 i;
uint256 numDrops;
uint256[] _amounts;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
address recipient = _recipients[i];
uint256 amount = _amounts[i];
if (!signaturedrops[recipient]) {
assert(token.transfer(recipient, amount));
signaturedrops[recipient] = true;
numDrops = (numDrops) + (1);
dropAmount = (dropAmount) + (amount);
TokenDrop(recipient, amount, "SIGNATURE");
}

}


  }
}

//#LOOPVARS: i

contract PolicyPalNetworkToken { }