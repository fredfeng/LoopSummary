
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
uint256 previousSnapTotalStake;
uint256 balance;
uint256[][] snapshots;
mapping(address => uint256) withdrawals;
address _owner;
uint256 i;
uint8 BALANCE;
uint8 TOKENS;

  function foo() public {
    
for(uint256 i = 0; i < snapshots.length; i++){
if (i == snapshots.length - 1) {
uint256 currentTokens = snapshots[i][TOKENS];
uint256 b = ((currentTokens) * ((getTotalStake()) - (previousSnapTotalStake))) / (totalSupply);
balance = (balance) + (b);
return (balance) - (withdrawals[_owner]);
}

uint256 snapTotalStake = snapshots[i][BALANCE];
uint256 spanBalance = ((snapshots[i][TOKENS]) * ((snapTotalStake) - (previousSnapTotalStake))) / (totalSupply);
balance = (balance) + (spanBalance);
previousSnapTotalStake = (previousSnapTotalStake) + (snapTotalStake);
}


  }
}

//#LOOPVARS: i
