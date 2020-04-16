
pragma solidity ^0.5.10;



contract C {
  

  uint256 numWinners;
uint256 currentRId_;
uint256 tokensPerFirstMovers;
uint256 tokensPerFollowers;
uint256 i;
uint256 numFirstMovers;
mapping(uint256 => KittyPillarDataSets.Player) players_;
mapping(uint8 => mapping(uint256 => KittyPillarDataSets.Pillar)) pillarRounds_;
uint8 _wonPillarIdx;
uint256 totalEthCount;
mapping(uint256 => mapping(uint256 => KittyPillarDataSets.KittyRound)) kittyRounds_;

  function foo() public {
    
for(uint256 i = 0; i < numWinners; i++){
uint256 kittyId = pillarRounds_[_wonPillarIdx][currentRId_].kittyIds[i];
if (i < numFirstMovers) {
players_[kittyRounds_[kittyId][currentRId_].kittyOwnerPId].totalEth = (players_[kittyRounds_[kittyId][currentRId_].kittyOwnerPId].totalEth) + (tokensPerFirstMovers);
totalEthCount = (totalEthCount) + (tokensPerFirstMovers);
} else {
players_[kittyRounds_[kittyId][currentRId_].kittyOwnerPId].totalEth = (players_[kittyRounds_[kittyId][currentRId_].kittyOwnerPId].totalEth) + (tokensPerFollowers);
totalEthCount = (totalEthCount) + (tokensPerFollowers);
}

}


  }
}

//#LOOPVARS: i

contract KittyPillarDataSets.Pillar { }

contract KittyPillarDataSets.KittyRound { }

contract KittyPillarDataSets.Player { }

contract uint256 => mappinguint256 { }

contract uint8 => mappinguint256 { }
