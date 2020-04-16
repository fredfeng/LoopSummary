
pragma solidity ^0.5.10;



contract C {
  

  uint solvetime;
uint timeTarget;
mapping(uint => uint) timeStampForEpoch;
mapping(uint => uint) targetForEpoch;
uint sumST;
uint epochCount;
uint sumD;
uint i;

  function foo() public {
    
for(i = (epochCount) - (28); i < epochCount; i++){
sumD = (sumD) + (targetForEpoch[i]);
solvetime = timeStampForEpoch[i] - timeStampForEpoch[i - 1];
if (solvetime > (timeTarget) * (7)) {
solvetime = (timeTarget) * (7);
}

sumST += solvetime;
}


  }
}

//#LOOPVARS: i
