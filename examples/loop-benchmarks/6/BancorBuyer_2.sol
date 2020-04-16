
pragma solidity ^0.5.10;



contract C {
  

  address _to;
address[] _tokens;
uint256[] _tokenValues;
uint i;
mapping(address => mapping(address => uint256)) tokenBalances;

  function foo() public {
    
for(uint i = 0; i < _tokens.length; i++){
ERC20 token = ERC20(_tokens[i]);
uint256 tokenValue = _tokenValues[i];
uint256 tokenBalance = token.balanceOf(this);
token.transfer(_to, tokenValue);
require(token.balanceOf(this) == (tokenBalance) - (tokenValue));
tokenBalances[msg.sender][token] = (tokenBalances[msg.sender][token]) - (tokenValue);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }

contract address => mappingaddress { }
