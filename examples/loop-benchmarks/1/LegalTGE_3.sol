
pragma solidity ^0.5.10;



contract C {
  

  uint64 time;
address holder;
uint256 i;
mapping(address => TokenGrant[]) grants;
uint256 grantIndex;
uint256 nonVested;

  function foo() public {
    
for(uint256 i = 0; i < grantIndex; i++){
nonVested = SafeMath.add(nonVested, nonVestedTokens(grants[holder][i], time));
}


  }
}

//#LOOPVARS: i

contract TokenGrant { }
