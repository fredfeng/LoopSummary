
pragma solidity ^0.5.10;



contract C {
  

  uint playNo;
mapping(uint => betInfo) playerBetInfoOf;
uint currentRewardNum;
mapping(address => uint256) userTokenOf;
uint nextRewardPlayNo;
uint i;

  function foo() public {
    
for(uint i = 0; nextRewardPlayNo < playNo && i < currentRewardNum; i++){
betInfo p = playerBetInfoOf[nextRewardPlayNo];
if (!p.IsReturnAward) {
p.IsReturnAward = true;
p.IsWin = true;
uint AllAmount = (p.BetAmount) * (1 + p.Odds);
userTokenOf[p.Player] = (userTokenOf[p.Player]) + (AllAmount);
userTokenOf[this] = (userTokenOf[this]) - (AllAmount);
}

nextRewardPlayNo++;
}


  }
}

//#LOOPVARS: i

contract betInfo { }
