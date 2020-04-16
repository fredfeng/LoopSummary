
pragma solidity ^0.5.10;



contract C {
  

  uint _num;
address _target;
uint256 len;
uint256 i;
mapping(address => TimeRec[]) frozenTimes;
address[] frozenAccounts;

  function foo() public {
    
while(i < len){
address frozenAddr = frozenAccounts[i];
if (frozenAddr == _target) {
TimeRec timePair = frozenTimes[frozenAddr][_num];
return timePair.remain;
}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }
