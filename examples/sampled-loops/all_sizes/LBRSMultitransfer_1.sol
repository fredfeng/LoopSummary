
pragma solidity ^0.5.10;



contract C {
  

  uint256 requestCost;
address[] oracles;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < oracles.length; i++){
requestCost = (requestCost) + (OracleI(oracles[i]).getPrice());
}


  }
}

//#LOOPVARS: i
