
pragma solidity ^0.5.10;



contract C {
  

  uint8 CHECK_POINT_HOUR;
uint32 cs;
mapping(uint32 => uint32[]) areaCheckPoints;
uint32 _area;
uint32 _count;
uint32 ce4;
AreaCheckPoint _userAreaCheckPoints;
uint32 cp;

  function foo() public {
    
for(cp = cs; cp <= ce4; cp += CHECK_POINT_HOUR){
areaCheckPoints[cp][_area] += _count;
_userAreaCheckPoints.hour[cp][_area] += _count;
}


  }
}

//#LOOPVARS: cp

contract AreaCheckPoint { }