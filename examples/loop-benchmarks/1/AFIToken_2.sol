
pragma solidity ^0.5.10;



contract C {
  

  address[] whitelistArray;
mapping(address => uint256) balances;
uint256 i;
mapping(address => uint256) snapshotBalance;
uint256 whitelistLength;

  function foo() public {
    
for(uint256 i = 0; i < whitelistLength; i++){
snapshotBalance[whitelistArray[i]] = balances[whitelistArray[i]];
}


  }
}

//#LOOPVARS: i
