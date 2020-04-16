
pragma solidity ^0.5.10;



contract C {
  

  uint playNo;
mapping(uint => betInfo) playerBetInfoOf;
uint currentRewardNum;
uint _minGameResult;
uint _midGameResult;
uint nextRewardPlayNo;
uint _maxGameResult;
uint i;

  function foo() public {
    
for(uint i = 0; nextRewardPlayNo < playNo && i < currentRewardNum; i++){
betInfo p = playerBetInfoOf[nextRewardPlayNo];
if (!p.IsReturnAward) {
p.IsReturnAward = true;
uint realOdd = _playRealOdds(p.BetType, p.Odds, p.SmallNum, p.BigNum, _minGameResult, _midGameResult, _maxGameResult);
p.IsWin = _calResultReturnIsWin(nextRewardPlayNo, realOdd);
if (p.IsWin) {
p.Odds = realOdd;
}

}

nextRewardPlayNo++;
}


  }
}

//#LOOPVARS: i

contract betInfo { }
