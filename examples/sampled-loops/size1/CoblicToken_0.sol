
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bytes32[]) lockReason;
uint256 amount;
address _of;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < lockReason[_of].length; i++){
amount = amount.add(tokensLocked(_of, lockReason[_of][i]));
}


  }
}

//#LOOPVARS: i
