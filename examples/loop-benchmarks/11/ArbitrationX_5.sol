
pragma solidity ^0.5.10;



contract C {
  

  uint milestoneTokenAmount;
uint totalEtherInvestment;
uint milestoneTokenTarget;
uint currentMilestone;
uint _etherAmount;
Milestone[] milestones;
uint totalToken;
uint milestoneEtherTarget;
uint totalEther;
uint totalTokenInvestment;
address _investor;
uint milestoneEtherAmount;
uint _tokenAmount;
mapping(address => Investor) deals;
uint i;
mapping(address => uint[]) etherPartition;
mapping(address => uint[]) tokenPartition;

  function foo() public {
    
for(uint i = currentMilestone; i < milestones.length; i++){
milestoneEtherTarget = milestones[i].etherAmount;
milestoneTokenTarget = milestones[i].tokenAmount;
milestoneEtherAmount = ((_etherAmount) * (milestoneEtherTarget)) / (totalEther);
milestoneTokenAmount = ((_tokenAmount) * (milestoneTokenTarget)) / (totalToken);
totalEtherInvestment = (totalEtherInvestment) + (milestoneEtherAmount);
totalTokenInvestment = (totalTokenInvestment) + (milestoneTokenAmount);
if (deals[_investor].sumEther > 0) {
etherPartition[_investor][i] += milestoneEtherAmount;
tokenPartition[_investor][i] += milestoneTokenAmount;
} else {
etherPartition[_investor].push(milestoneEtherAmount);
tokenPartition[_investor].push(milestoneTokenAmount);
}

}


  }
}

//#LOOPVARS: i

contract Investor { }

contract Milestone { }
