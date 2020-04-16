
pragma solidity ^0.5.10;



contract C {
  

  address _beneficiary;
address[] _tokens;
uint256[] _tokenValues;
uint i;
mapping(address => mapping(address => uint256)) tokenBalances;

  function foo() public {
    
for(uint i = 0; i < _tokens.length; i++){
ERC20 token = ERC20(_tokens[i]);
uint256 tokenValue = _tokenValues[i];
uint256 balance = token.balanceOf(this);
token.transferFrom(msg.sender, this, tokenValue);
require(token.balanceOf(this) == (balance) + (tokenValue));
tokenBalances[_beneficiary][token] = (tokenBalances[_beneficiary][token]) + (tokenValue);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }

contract address => mappingaddress { }
