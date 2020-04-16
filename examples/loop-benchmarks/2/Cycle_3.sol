
pragma solidity ^0.5.10;



contract C {
  

  uint postDisputeEth;
uint currentMilestone;
uint _milestoneDispute;
address _investor;
mapping(address => Investor) deals;
uint i;
mapping(address => uint[]) etherPartition;

  function foo() public {
    
for(uint i = _milestoneDispute; i < currentMilestone; i++){
postDisputeEth += etherPartition[_investor][i];
deals[_investor].etherUsed += etherPartition[_investor][i];
}


  }
}

//#LOOPVARS: i

contract Investor { }
