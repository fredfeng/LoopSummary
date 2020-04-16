
pragma solidity ^0.5.10;



contract C {
  

  uint256 decimals;
address[] addresses;
uint256[] amounts;
uint256 cap;
mapping(address => uint256) givenBountyTokens;
uint i;
uint256 totalGivenBountyTokens;
GastroAdvisorToken token;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
address to = addresses[i];
uint256 value = amounts[i] * (10 ** decimals);
givenBountyTokens[to] = (givenBountyTokens[to]) + (value);
totalGivenBountyTokens = (totalGivenBountyTokens) + (value);
require(totalGivenBountyTokens <= cap);
token.mint(to, value);
}


  }
}

//#LOOPVARS: i

contract GastroAdvisorToken { }
