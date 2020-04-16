
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
address[] icedBalancesAdvisors;
mapping(address => uint256) balances;
uint256 index;
uint256 MAX_NUM_NAVITOKENS;
address[] icedBalancesReserveAndTeam;
mapping(address => uint256) mapIcedBalancesAdvisors;
address[] _addr;
DefrostClass[] _defrostClass;
mapping(address => uint256) mapIcedBalancesReserveAndTeamFrosted;
uint256[] _amounts;

  function foo() public {
    
for(uint256 index = 0; index < _addr.length; index++){
address toAddress = _addr[index];
uint amount = _amounts[index];
DefrostClass defrostClass = _defrostClass[index];
totalSupply = (totalSupply) + (amount);
require(totalSupply <= MAX_NUM_NAVITOKENS);
if (defrostClass == DefrostClass.Contributor) {
balances[toAddress] = (balances[toAddress]) + (amount);
Transfer(address(0), toAddress, amount);
} else if (defrostClass == DefrostClass.ReserveAndTeam) {
icedBalancesReserveAndTeam.push(toAddress);
mapIcedBalancesReserveAndTeamFrosted[toAddress] = (mapIcedBalancesReserveAndTeamFrosted[toAddress]) + (amount);
Frosted(toAddress, amount, uint256(defrostClass));
} else if (defrostClass == DefrostClass.Advisor) {
icedBalancesAdvisors.push(toAddress);
mapIcedBalancesAdvisors[toAddress] = (mapIcedBalancesAdvisors[toAddress]) + (amount);
Frosted(toAddress, amount, uint256(defrostClass));
}



}


  }
}

//#LOOPVARS: index

contract DefrostClass { }
