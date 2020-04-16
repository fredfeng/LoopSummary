
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
uint256 _amount;
PolicyPalNetworkToken token;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
address recipient = _recipients[i];
assert(token.transfer(recipient, _amount));
TokenDrop(recipient, _amount);
}


  }
}

//#LOOPVARS: i

contract PolicyPalNetworkToken { }
