
pragma solidity ^0.5.10;



contract C {
  

  uint64 i;
mapping(uint64 => address) ownerAddresses;
uint64 totalOwners;
uint256 currentBalance;
mapping(address => uint256) ownerPercentages;
mapping(address => uint256) ownerShareTokens;
address token;
mapping(address => mapping(address => uint256)) balances;

  function foo() public {
    
for(uint64 i = 0; i < totalOwners; i++){
address owner = ownerAddresses[i];
if (ownerShareTokens[owner] > 0) {
balances[owner][token] = SafeMath.add(SafeMath.div(SafeMath.mul(currentBalance, ownerPercentages[owner]), 100000), balances[owner][token]);
}

}


  }
}

//#LOOPVARS: i

contract address => mappingaddress { }
