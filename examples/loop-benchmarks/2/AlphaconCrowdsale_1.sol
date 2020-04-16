
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
Holder[] holders;
uint256 balance;
uint256 coeff;

  function foo() public {
    
for(uint8 i = 0; i < holders.length; i++){
uint256 holderAmount = ((balance) * (uint256(holders[i].ratio))) / (coeff);
holders[i].addr.transfer(holderAmount);
}


  }
}

//#LOOPVARS: i

contract Holder { }
