
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint depositValue;
address[] parentAddresses;
address investorAddress;

  function foo() public {
    
for(uint8 i = 0; i < parentAddresses.length; i++){
address parent = parentAddresses[i];
if (parent == address(0)) break;

uint rewardValue = calculateRewardForLevel(i + 1, depositValue);
parent.transfer(rewardValue);
emit ReferrerBonus(investorAddress, parent, i + 1, rewardValue);
}


  }
}

//#LOOPVARS: i
