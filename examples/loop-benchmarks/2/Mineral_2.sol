
pragma solidity ^0.5.10;



contract C {
  

  uint32[] ptArea;
uint32 h;
uint32 hour;
mapping(uint32 => uint32[][]) areaHourDeployed;
uint32 area;
uint32 nc;
int64 totalInc;

  function foo() public {
    
for(h = nc; h <= hour; ++h){
ptArea = areaHourDeployed[h][area];
totalInc += ptArea[0] + ptArea[1] + ptArea[2] - areaHourDeployed[h - 4][area][0] - areaHourDeployed[h - 8][area][1] - areaHourDeployed[h - 24][area][2];
}


  }
}

//#LOOPVARS: h

contract int64 { }
