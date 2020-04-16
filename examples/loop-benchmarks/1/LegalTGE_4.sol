
pragma solidity ^0.5.10;



contract C {
  

  uint64 date;
address holder;
uint256 i;
mapping(address => TokenGrant[]) grants;
uint256 grantIndex;

  function foo() public {
    
for(uint256 i = 0; i < grantIndex; i++){
date = Math.max64(grants[holder][i].vesting, date);
}


  }
}

//#LOOPVARS: i

contract TokenGrant { }
