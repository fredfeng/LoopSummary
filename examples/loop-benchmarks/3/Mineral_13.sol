
pragma solidity ^0.5.10;



contract C {
  

  uint8 CHECK_POINT_HOUR;
uint32 ps;
address _user;
uint32[] userMiners;
uint32[] totalMiners;
uint32 end;
uint32 writeCount;
uint result;
uint income;
uint32 area;

  function foo() public {
    
while(ps < end){
(income, writeCount) = _collectMinersByCheckPoints(_user, area, ps, uint32(Math.min64(end, ps + CHECK_POINT_HOUR)), totalMiners, userMiners, writeCount);
result += income;
ps += CHECK_POINT_HOUR;
}

  }
}

//#LOOPVARS: 
