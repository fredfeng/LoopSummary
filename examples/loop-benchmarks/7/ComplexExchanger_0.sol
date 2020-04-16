
pragma solidity ^0.5.10;



contract C {
  

  uint256 value;
address[] oracles;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < oracles.length; i++){
OracleI oracle = OracleI(oracles[i]);
uint callPrice = oracle.getPrice();
if (oracles[i].balance < callPrice) {
value = (value) - (callPrice);
oracles[i].transfer(callPrice);
}

if (oracle.updateRate()) OracleRequest(oracles[i]);

}


  }
}

//#LOOPVARS: i

contract OracleI { }
