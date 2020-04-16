
pragma solidity ^0.5.10;



contract C {
  

  address _target;
uint256 len;
uint256 i;
mapping(address => TimeRec[]) frozenTimes;
address[] frozenAccounts;

  function foo() public {
    
while(i < len){
address frozenAddr = frozenAccounts[i];
if (frozenAddr == _target) {
return frozenTimes[frozenAddr].length;
}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }
