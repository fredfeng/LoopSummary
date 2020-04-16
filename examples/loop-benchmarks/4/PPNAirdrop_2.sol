
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
PolicyPalNetworkToken token;
uint256[] _amounts;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
address recipient = _recipients[i];
uint256 amount = _amounts[i];
assert(token.transfer(recipient, amount));
TokenDrop(recipient, amount);
}


  }
}

//#LOOPVARS: i

contract PolicyPalNetworkToken { }
