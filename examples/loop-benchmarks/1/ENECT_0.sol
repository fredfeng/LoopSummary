
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => LockupInfo[]) lockupInfo;
uint256 lockedBalance;
uint256 idx;
address _holder;

  function foo() public {
    
for(uint256 idx = 0; idx < lockupInfo[_holder].length; idx++){
lockedBalance = (lockedBalance) + (lockupInfo[_holder][idx].lockupBalance);
}


  }
}

//#LOOPVARS: idx

contract LockupInfo { }
