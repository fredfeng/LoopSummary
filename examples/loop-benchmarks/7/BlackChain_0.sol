
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256[]) betHistory;
mapping(address => uint256) playerBets;
uint256[] _timestamps;
mapping(uint256 => address[]) mirrors;
uint256[] timestampList;
uint256 averageTimestamp;
uint i;
uint256 countBet;

  function foo() public {
    
for(i = 0; i < _timestamps.length; i++){
timestampList.push(_timestamps[i]);
mirrors[_timestamps[i]].push(msg.sender);
betHistory[msg.sender].push(_timestamps[i]);
averageTimestamp = (averageTimestamp) * (countBet) + _timestamps[i];
averageTimestamp = (averageTimestamp) / (countBet + 1);
countBet++;
playerBets[msg.sender]++;
}


  }
}

//#LOOPVARS: i
