
pragma solidity ^0.5.10;



contract C {
  

  address _account;
uint256 len;
uint256 i;
mapping(address => TimeRec[]) frozenTimes;
address[] frozenAccounts;

  function foo() public {
    
while(i < len){
address frozenAddr = frozenAccounts[i];
if (frozenAddr == _account) {
uint256 timeRecLen = frozenTimes[frozenAddr].length;
uint256 j = 0;
while(j < timeRecLen) {
TimeRec timePair = frozenTimes[frozenAddr][j];
totalRemain = totalRemain.add(timePair.remain);
j = j.add(1);
}

}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }
