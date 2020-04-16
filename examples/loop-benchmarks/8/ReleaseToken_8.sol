
pragma solidity ^0.5.10;



contract C {
  

  address _target;
uint256 len;
uint256 i;
mapping(address => TimeRec[]) frozenTimes;
itoken owned;
address[] frozenAccounts;

  function foo() public {
    
while(i < len){
address destAddr = frozenAccounts[i];
if (destAddr == _target) {
if (frozenTimes[destAddr].length == 1 && 0 == frozenTimes[destAddr][0].duration && frozenTimes[destAddr][0].endTime > 0 && now >= frozenTimes[destAddr][0].endTime) {
bool res = removeAccount(i);
if (!res) {
return false;
}

owned.freezeAccount(destAddr, false);
ReleaseFunds(destAddr, frozenTimes[destAddr][0].amount);
}

return true;
}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }

contract itoken { }
