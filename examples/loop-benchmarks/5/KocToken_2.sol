
pragma solidity ^0.5.10;



contract C {
  

  address _owner;
uint256 sum;
mapping(address => Vesting[]) vestings;
uint i;

  function foo() public {
    
for(uint i = 0; i < vestings[_owner].length; i++){
Vesting vs = vestings[_owner][i];
uint256 release = vestingRelease(vs.startTime, vs.initReleaseAmount, vs.amount, vs.interval, vs.periods);
uint256 keep = (release) - (vs.withdrawed);
if (keep >= 0) {
sum = (sum) + (keep);
}

}


  }
}

//#LOOPVARS: i

contract Vesting { }
