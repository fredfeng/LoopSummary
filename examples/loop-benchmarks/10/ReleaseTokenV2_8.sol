
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
if (frozenTimes[destAddr].length == 1 && frozenTimes[destAddr][0].endTime == frozenTimes[destAddr][0].releasePeriodEndTime && frozenTimes[destAddr][0].endTime > 0 && now >= frozenTimes[destAddr][0].endTime) {
uint256 releasedAmount = frozenTimes[destAddr][0].amount;
if (!removeLockedTime(destAddr, 0)) {
return false;
}

bool res = removeAccount(i);
if (!res) {
return false;
}

owned.freezeAccount(destAddr, false);
ReleaseFunds(destAddr, releasedAmount);
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
