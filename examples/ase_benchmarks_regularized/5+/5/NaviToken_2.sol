






contract C {
  

  

  address[] icedBalancesAdvisors;
mapping(address => uint256) mapIcedBalancesAdvisors;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 index = 0; index < icedBalancesAdvisors.length; index++){
address currentAddress = icedBalancesAdvisors[index];
uint256 amountToDefrost = mapIcedBalancesAdvisors[currentAddress];
if (amountToDefrost > 0) {
balances[currentAddress] = ((balances[currentAddress]) + (amountToDefrost));
mapIcedBalancesAdvisors[currentAddress] = ((mapIcedBalancesAdvisors[currentAddress]) - (amountToDefrost));


}

}


  }

  

}

//#LOOPVARS: index


