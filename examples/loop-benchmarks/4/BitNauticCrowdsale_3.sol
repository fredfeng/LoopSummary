
pragma solidity ^0.5.10;



contract C {
  

  uint256[] values;
address[] recipients;
uint256 i;
uint256 bountySupply;
MintableToken token;

  function foo() public {
    
for(uint256 i = 0; i < recipients.length; i++){
values[i] = SafeMath.mul(values[i], 1 ether);
if (bountySupply >= values[i]) {
return false;
}

bountySupply = SafeMath.sub(bountySupply, values[i]);
token.mint(recipients[i], values[i]);
}


  }
}

//#LOOPVARS: i

contract MintableToken { }
