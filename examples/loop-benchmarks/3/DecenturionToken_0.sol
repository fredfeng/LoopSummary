
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint[] amounts;
uint[] endTimes;
uint[] startTimes;
uint currentAmount;
uint bonus;

  function foo() public {
    
for(uint8 i = 0; i < amounts.length; i++){
if (now >= startTimes[i] && now <= endTimes[i]) {
bonus = amounts[i];
currentAmount = (currentAmount) + (bonus);
return bonus;
}

}


  }
}

//#LOOPVARS: i
