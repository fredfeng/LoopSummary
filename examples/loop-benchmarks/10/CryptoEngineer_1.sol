
pragma solidity ^0.5.10;



contract C {
  

  uint256 priceCrystals;
uint256 priceEth;
mapping(uint256 => EngineerData) engineers;
uint256 numberOfEngineer;
PlayerData p;
uint256[] engineerNumbers;
uint256 engineerIdx;
uint256 research;

  function foo() public {
    
for(uint256 engineerIdx = 0; engineerIdx < numberOfEngineer; engineerIdx++){
uint256 engineerNumber = engineerNumbers[engineerIdx];
EngineerData e = engineers[engineerIdx];
if (engineerNumber > e.limit || engineerNumber < 0) {
revert();
}

if (engineerNumber > 0) {
uint256 currentEngineerCount = p.engineersCount[engineerIdx];
p.engineersCount[engineerIdx] = SafeMath.min(e.limit, SafeMath.add(p.engineersCount[engineerIdx], engineerNumber));
research = SafeMath.add(research, SafeMath.mul(SafeMath.sub(p.engineersCount[engineerIdx], currentEngineerCount), e.baseResearch));
priceCrystals = SafeMath.add(priceCrystals, SafeMath.mul(e.basePrice, engineerNumber));
priceEth = SafeMath.add(priceEth, SafeMath.mul(e.baseETH, engineerNumber));
}

}


  }
}

//#LOOPVARS: engineerIdx

contract PlayerData { }

contract EngineerData { }
