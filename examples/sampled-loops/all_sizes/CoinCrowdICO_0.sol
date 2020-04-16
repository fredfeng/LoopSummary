
pragma solidity ^0.5.10;



contract C {
  

  uint256[] euroThreshold;
uint256 bonusApplied;
uint256[] bonusThreshold;
CoinCrowdICO icoContract;
uint256 soldTokensWithoutBonus;
uint i;

  function foo() public {
    
for(uint i = 0; i < euroThreshold.length; i++){
if ((icoContract.euroRaised(soldTokensWithoutBonus)) / (1000) > euroThreshold[i]) {
bonusApplied = bonusThreshold[i];
}

}


  }
}

//#LOOPVARS: i

contract CoinCrowdICO { }
