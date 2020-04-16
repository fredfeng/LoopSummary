
pragma solidity ^0.5.10;



contract C {
  

  address _user;
uint32[] area;
uint payment;
uint32[] count;
uint32[] period;
uint MINER_8_HOURS;
uint32 minerCount;
uint MINER_4_HOURS;
uint32 _hour;
uint32[][] _areaDeployed;
uint index;
uint32[][] _userAreaDeployed;
uint MINER_24_HOURS;

  function foo() public {
    
for(uint index = 0; index < area.length; ++index){
require(period[index] == 4 || period[index] == 8 || period[index] == 24);
if (period[index] == 4) {
_areaDeployed[area[index]][0] += count[index];
_userAreaDeployed[area[index]][0] += count[index];
payment += count[index] * MINER_4_HOURS;
} else if (period[index] == 8) {
_areaDeployed[area[index]][1] += count[index];
_userAreaDeployed[area[index]][1] += count[index];
payment += count[index] * MINER_8_HOURS;
} else if (period[index] == 24) {
_areaDeployed[area[index]][2] += count[index];
_userAreaDeployed[area[index]][2] += count[index];
payment += count[index] * MINER_24_HOURS;
}



minerCount += count[index];
DeployMiner(_user, area[index], _hour, _hour + period[index], count[index]);
adjustDeployRange(area[index], _hour, _hour + period[index]);
}


  }
}

//#LOOPVARS: index
