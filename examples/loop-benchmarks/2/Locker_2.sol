
pragma solidity ^0.5.10;



contract C {
  

  Release _r;
uint i;
uint releaseRatio;

  function foo() public {
    
for(uint i = _r.releaseTimes.length - 1; i >= 0; i--){
if (now >= _r.releaseTimes[i]) {
releaseRatio = _r.releaseRatios[i];
break;
}

}


  }
}

//#LOOPVARS: i

contract Release { }
