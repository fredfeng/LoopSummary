
pragma solidity ^0.5.10;



contract C {
  

  bool tokenReleaseAtStart;
uint currentMilestone;
uint ethForMilestone;
address[] dealsList;
mapping(address => Investor) deals;
uint i;
mapping(address => uint[]) etherPartition;
mapping(address => uint[]) tokenPartition;

  function foo() public {
    
for(uint i = 0; i < dealsList.length; i++){
address investor = dealsList[i];
if (deals[investor].disputing == false) {
if (deals[investor].verdictForInvestor != true) {
ethForMilestone += etherPartition[investor][currentMilestone];
deals[investor].etherUsed += etherPartition[investor][currentMilestone];
if (tokenReleaseAtStart == false) {
deals[investor].tokenAllowance += tokenPartition[investor][currentMilestone];
}

}

}

}


  }
}

//#LOOPVARS: i

contract Investor { }
