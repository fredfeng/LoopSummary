
pragma solidity ^0.5.10;



contract C {
  

  ERC20[] someTokens;
uint i;
uint j;

  function foo() public {
    
for(uint j = 0; j < i; j++){
require(someTokens[i] != someTokens[j], "unbundleSome: should not unbundle same token multiple times");
}


  }
}

//#LOOPVARS: j

contract ERC20 { }
