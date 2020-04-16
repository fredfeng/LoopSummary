
pragma solidity ^0.5.10;



contract C {
  

  address[] _beneficiaries;
uint256[] _tokenAmounts;
MintableToken token;
uint256 tokensSold;
uint i;

  function foo() public {
    
for(uint i = 0; i < _beneficiaries.length; i++){
tokensSold = (tokensSold) + (_tokenAmounts[i]);
token.mint(_beneficiaries[i], _tokenAmounts[i]);
TokenPurchase(msg.sender, _beneficiaries[i], 0, _tokenAmounts[i]);
}


  }
}

//#LOOPVARS: i

contract MintableToken { }
