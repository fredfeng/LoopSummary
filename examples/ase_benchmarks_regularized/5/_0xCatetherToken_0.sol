






contract C {
  

  

  mapping(uint => uint) timeStampForEpoch;
uint epochCount;
uint timeTarget;
uint sumST;
mapping(uint => uint) targetForEpoch;
uint i;
uint solvetime;
uint sumD;

  function foo() public {
    
for(uint256 i = ((epochCount) - (28)); i < epochCount; i++){
sumD = ((sumD) + (targetForEpoch[i]));
solvetime = timeStampForEpoch[i] - timeStampForEpoch[i - 1];
if (solvetime > ((timeTarget) * (7))) {
solvetime = ((timeTarget) * (7));
}

sumST += solvetime;
}


  }

  

}

//#LOOPVARS: i


