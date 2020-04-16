
pragma solidity ^0.5.10;



contract C {
  

  uint256 len;
uint256 i;
mapping(address => TimeRec[]) frozenTimes;
itoken owned;
address[] frozenAccounts;

  function foo() public {
    
while(i < len){
address target = frozenAccounts[i];
if (frozenTimes[target].length == 1 && frozenTimes[target][0].endTime == frozenTimes[target][0].releasePeriodEndTime && frozenTimes[target][0].endTime > 0 && now >= frozenTimes[target][0].endTime) {
uint256 releasedAmount = frozenTimes[target][0].amount;
if (!removeLockedTime(target, 0)) {
return false;
}

bool res = removeAccount(i);
if (!res) {
return false;
}

owned.freezeAccount(target, false);
ReleaseFunds(target, releasedAmount);
len = (len) - (1);
} else {
i = (i) + (1);
}

}

  }
}

//#LOOPVARS: 

contract TimeRec { }

contract itoken { }
