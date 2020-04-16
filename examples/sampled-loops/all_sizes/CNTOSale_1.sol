
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _keys;
uint256 roundNum;
uint8[] _status;
uint256 i;
uint256[] _endTimes;
uint256[] _divies;
uint256[] _pots;
uint256[] _ethers;
uint256[] _startTimes;

  function foo() public {
    
while(i < roundNum){
(_divies[i], _startTimes[i], _endTimes[i], _ethers[i], _keys[i], _pots[i], _status[i]) = getRoundInfo(i + 1);
i++;
}

  }
}

//#LOOPVARS: 
