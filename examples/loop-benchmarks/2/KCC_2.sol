
pragma solidity ^0.5.10;



contract C {
  

  uint256 i;
uint256 airdropSupply;
uint256 count;
address[] _holders;
uint256 paySize;

  function foo() public {
    
for(uint256 i = 0; i < count; i++){
transfer(_holders[i], paySize);
airdropSupply = (airdropSupply) + (paySize);
}


  }
}

//#LOOPVARS: i
