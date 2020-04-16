
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(uint256 => KittyPillarDataSets.Round) round_;
uint256 maxPower_;
uint256 currentRId_;
mapping(uint8 => mapping(uint256 => KittyPillarDataSets.Pillar)) pillarRounds_;
uint256 minPower;
uint8 _pillarIdx;

  function foo() public {
    
for(i = 0; i < 3; i++){
if (i != _pillarIdx) {
if (pillarRounds_[i][currentRId_].totalContributions >= (round_[currentRId_].targetContributions / 2)) {
minPower = maxPower_ / 2;
break;
}

}

}


  }
}

//#LOOPVARS: i

contract KittyPillarDataSets.Pillar { }

contract uint8 => mappinguint256 { }

contract KittyPillarDataSets.Round { }
