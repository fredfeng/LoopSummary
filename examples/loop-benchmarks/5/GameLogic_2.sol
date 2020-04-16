
pragma solidity ^0.5.10;



contract C {
  

  uint256 tigerResult;
uint256 dragonResult;
mapping(uint256 => Datasets.Player) mapIdxPlayer;
uint256 len;
uint j;
uint p;
Datasets.Beter[] winBetters;
uint256 totalAmount;
Datasets.Beter[] betters;

  function foo() public {
    
for(uint j = 0; j < len; j++){
Datasets.Beter item = betters[j];
if (checkLucky(mapIdxPlayer[item.betId].addr, dragonResult, tigerResult)) {
winBetters[p] = betters[j];
totalAmount += betters[j].amount;
p++;
}

}


  }
}

//#LOOPVARS: j

contract Datasets.Player { }

contract Datasets.Beter { }
