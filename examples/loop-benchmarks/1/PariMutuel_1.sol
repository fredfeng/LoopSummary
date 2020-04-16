
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(uint8 => mapping(address => uint256)) balancesForOutcome;
address _address;
uint256 total;
uint8 numberOfOutcomes;

  function foo() public {
    
for(uint8 i = 0; i < numberOfOutcomes; i++){
total = (total) + (balancesForOutcome[i][_address]);
}


  }
}

//#LOOPVARS: i

contract uint8 => mappingaddress { }
