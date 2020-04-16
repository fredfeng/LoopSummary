
pragma solidity ^0.5.10;



contract C {
  

  address[] oracles;
uint256 ORACLE_ACTUAL;
uint256 i;
uint256 count;

  function foo() public {
    
for(uint256 i = 0; i < oracles.length; i++){
OracleI oracle = OracleI(oracles[i]);
if ((oracle.rate() != 0) && !oracle.waitQuery() && (now - oracle.updateTime()) < ORACLE_ACTUAL) count++;

}


  }
}

//#LOOPVARS: i

contract OracleI { }
