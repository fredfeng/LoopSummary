
pragma solidity ^0.5.10;



contract C {
  

  uint32[] ptArea;
uint32 i;
uint32[] userMiners;
uint32 h;
uint32[] totalMiners;
AreaHourDeployed _userAreaHourDeployed;
mapping(uint32 => uint32[][]) areaHourDeployed;
uint32 end;
uint32 start;
uint32[] ptUser;
uint32 area;

  function foo() public {
    
for(h = start + 1; h < end; ++h){
ptUser = _userAreaHourDeployed.hour[h][area];
ptArea = areaHourDeployed[h][area];
totalMiners[i] = totalMiners[i - 1] + ptArea[0] + ptArea[1] + ptArea[2] - areaHourDeployed[h - 4][area][0] - areaHourDeployed[h - 8][area][1] - areaHourDeployed[h - 24][area][2];
userMiners[i] = userMiners[i - 1] + ptUser[0] + ptUser[1] + ptUser[2] - _userAreaHourDeployed.hour[h - 4][area][0] - _userAreaHourDeployed.hour[h - 8][area][1] - _userAreaHourDeployed.hour[h - 24][area][2];
++i;
}


  }
}

//#LOOPVARS: h

contract AreaHourDeployed { }
