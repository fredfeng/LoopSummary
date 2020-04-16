
pragma solidity ^0.5.10;



contract C {
  

  uint32[] area;
uint32[] count;
uint32[] period;
uint32 _area;
uint index;
uint32 _count;

  function foo() public {
    
for(uint index = 0; index < area.length; ++index){
_area = area[index];
_count = count[index];
if (period[index] == 4) {
for (cp = cs; cp <= ce4; cp += CHECK_POINT_HOUR) {
areaCheckPoints[cp][_area] += _count;
_userAreaCheckPoints.hour[cp][_area] += _count;
}

} else if (period[index] == 8) {
for (cp = cs; cp <= ce8; cp += CHECK_POINT_HOUR) {
areaCheckPoints[cp][_area] += _count;
_userAreaCheckPoints.hour[cp][_area] += _count;
}

} else if (period[index] == 24) {
for (cp = cs; cp <= ce24; cp += CHECK_POINT_HOUR) {
areaCheckPoints[cp][_area] += _count;
_userAreaCheckPoints.hour[cp][_area] += _count;
}

}



}


  }
}

//#LOOPVARS: index
