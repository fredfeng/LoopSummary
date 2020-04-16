
pragma solidity ^0.5.10;



contract C {
  

  uint32 h;
uint32 hour;
AreaHourDeployed _userAreaHourDeployed;
uint32[] ptUser;
uint32 area;
uint32 nc;
int64 userInc;

  function foo() public {
    
for(h = nc; h <= hour; ++h){
ptUser = _userAreaHourDeployed.hour[h][area];
userInc += ptUser[0] + ptUser[1] + ptUser[2] - _userAreaHourDeployed.hour[h - 4][area][0] - _userAreaHourDeployed.hour[h - 8][area][1] - _userAreaHourDeployed.hour[h - 24][area][2];
}


  }
}

//#LOOPVARS: h

contract int64 { }

contract AreaHourDeployed { }
