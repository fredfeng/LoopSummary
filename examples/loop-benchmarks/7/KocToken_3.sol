
pragma solidity ^0.5.10;



contract C {
  

  address _to;
mapping(address => Vesting[]) vestings;
uint i;
uint256 sum;

  function foo() public {
    
for(uint i = 0; i < vestings[_to].length; i++){
if (vestings[_to][i].amount == vestings[_to][i].withdrawed) {
continue;
} else {
Vesting vs = vestings[_to][i];
uint256 release = vestingRelease(vs.startTime, vs.initReleaseAmount, vs.amount, vs.interval, vs.periods);
uint256 keep = (release) - (vs.withdrawed);
if (keep >= 0) {
vestings[_to][i].withdrawed = release;
sum = (sum) + (keep);
}

}

}


  }
}

//#LOOPVARS: i

contract Vesting { }
