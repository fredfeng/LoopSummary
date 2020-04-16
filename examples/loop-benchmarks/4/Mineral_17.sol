
pragma solidity ^0.5.10;



contract C {
  

  uint32[] ptArea;
uint8 CHECK_POINT_HOUR;
uint32 h;
AreaHourDeployed _userAreaHourDeployed;
mapping(uint32 => uint32[][]) areaHourDeployed;
uint32 start;
uint32[] ptUser;
uint32 area;
int64 userInc;
int64 totalInc;

  function foo() public {
    
for(h = start / CHECK_POINT_HOUR * CHECK_POINT_HOUR; h <= start; ++h){
ptUser = _userAreaHourDeployed.hour[h][area];
ptArea = areaHourDeployed[h][area];
totalInc += ptArea[0] + ptArea[1] + ptArea[2] - areaHourDeployed[h - 4][area][0] - areaHourDeployed[h - 8][area][1] - areaHourDeployed[h - 24][area][2];
userInc += ptUser[0] + ptUser[1] + ptUser[2] - _userAreaHourDeployed.hour[h - 4][area][0] - _userAreaHourDeployed.hour[h - 8][area][1] - _userAreaHourDeployed.hour[h - 24][area][2];
}


  }
}

//#LOOPVARS: h

contract int64 { }

contract AreaHourDeployed { }
