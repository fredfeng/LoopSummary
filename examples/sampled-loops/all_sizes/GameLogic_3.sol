
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(uint256 => mapping(uint8 => Datasets.Beter[])) mapBetter;
uint256 roundId;

  function foo() public {
    
for(uint8 i = 1; i < 4; i++){
Datasets.Beter[] betters = mapBetter[roundId][i];
uint256 len = betters.length;
if (len > 0) {
for (uint j = 0; j < len; j++) {
Datasets.Beter item = betters[j];
if (checkLucky(mapIdxPlayer[item.betId].addr, dragonResult, tigerResult)) {
winBetters[p] = betters[j];
totalAmount += betters[j].amount;
p++;
}

}

}

}


  }
}

//#LOOPVARS: i

contract uint256 => mappinguint8 { }

contract Datasets.Beter { }
