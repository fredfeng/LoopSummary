
pragma solidity ^0.5.10;



contract C {
  

  uint256 validOracles;
address[] oracles;
uint256 minRate;
uint256 i;
uint256 maxRate;

  function foo() public {
    
for(uint256 i = 0; i < oracles.length; i++){
OracleI oracle = OracleI(oracles[i]);
uint256 rate = oracle.rate();
if (oracle.waitQuery()) {
continue;
}

if (isRateValid(rate)) {
minRate = Math.min256(rate, minRate);
maxRate = Math.max256(rate, maxRate);
validOracles++;
} else {
InvalidRate(rate, oracles[i]);
}

}


  }
}

//#LOOPVARS: i

contract OracleI { }
