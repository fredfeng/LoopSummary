
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => uint256) tokenPools;
Stage currentStage;
uint256 stage;
uint256 weiAmount;
address beneficiary;
mapping(uint256 => uint256) stageRates;

  function foo() public {
    
for(uint256 stage = uint256(currentStage); stage <= 3; stage++){
uint256 tokensToBuy = (((weiAmount) * (stageRates[stage]))) / (1 ether);
if (tokensToBuy <= tokenPools[stage]) {
payoutTokens(beneficiary, tokensToBuy, weiAmount);
break;
} else {
tokensToBuy = tokenPools[stage];
uint256 usedWei = (((tokensToBuy) * (1 ether))) / (stageRates[stage]);
uint256 leftWei = (weiAmount) - (usedWei);
payoutTokens(beneficiary, tokensToBuy, usedWei);
if (stage == 3) {
beneficiary.transfer(leftWei);
break;
} else {
weiAmount = leftWei;
currentStage = Stage(stage + 1);
}

}

}


  }
}

//#LOOPVARS: stage

contract Stage { }
