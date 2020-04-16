
pragma solidity ^0.5.10;



contract C {
  

  uint256 unfreezeAmount;
uint256 i;
uint256 airdropSupply;
uint256 count;
address[] _holders;
uint256 paySize;

  function foo() public {
    
for(uint256 i = 0; i < count; i++){
transfer(_holders[i], paySize);
lockBalance(_holders[i], unfreezeAmount, now + 10368000);
lockBalance(_holders[i], unfreezeAmount, now + 10368000 + 2592000);
lockBalance(_holders[i], unfreezeAmount, now + 10368000 + 2592000 + 2592000);
lockBalance(_holders[i], unfreezeAmount, now + 10368000 + 2592000 + 2592000 + 2592000);
lockBalance(_holders[i], unfreezeAmount, now + 10368000 + 2592000 + 2592000 + 2592000 + 2592000);
airdropSupply = (airdropSupply) + (paySize);
}


  }
}

//#LOOPVARS: i
