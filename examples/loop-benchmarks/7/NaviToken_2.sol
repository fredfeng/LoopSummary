
pragma solidity ^0.5.10;



contract C {
  

  uint256 index;
mapping(address => uint256) mapIcedBalancesAdvisors;
address[] icedBalancesAdvisors;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 index = 0; index < icedBalancesAdvisors.length; index++){
address currentAddress = icedBalancesAdvisors[index];
uint256 amountToDefrost = mapIcedBalancesAdvisors[currentAddress];
if (amountToDefrost > 0) {
balances[currentAddress] = (balances[currentAddress]) + (amountToDefrost);
mapIcedBalancesAdvisors[currentAddress] = (mapIcedBalancesAdvisors[currentAddress]) - (amountToDefrost);
Transfer(address(0), currentAddress, amountToDefrost);
Defrosted(currentAddress, amountToDefrost, uint256(DefrostClass.Advisor));
}

}


  }
}

//#LOOPVARS: index
