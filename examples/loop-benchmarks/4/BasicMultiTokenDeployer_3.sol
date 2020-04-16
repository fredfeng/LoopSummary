
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
address beneficiary;
uint256 value;
ERC20[] someTokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < someTokens.length; i++){
for (uint j = 0; j < i; j++) {
require(someTokens[i] != someTokens[j], "unbundleSome: should not unbundle same token multiple times");
}

uint256 tokenAmount = ((someTokens[i].balanceOf(this)) * (value)) / (totalSupply);
someTokens[i].checkedTransfer(beneficiary, tokenAmount);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
