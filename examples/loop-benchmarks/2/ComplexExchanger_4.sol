
pragma solidity ^0.5.10;



contract C {
  

  uint256 ORACLE_TIMEOUT;
address[] oracles;
uint256 i;
uint256 requestTime;
uint256 count;

  function foo() public {
    
for(uint256 i = 0; i < oracles.length; i++){
if (OracleI(oracles[i]).waitQuery() && (now - requestTime) < ORACLE_TIMEOUT) {
count++;
}

}


  }
}

//#LOOPVARS: i
