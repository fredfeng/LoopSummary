
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256 perCityBoost;
uint16 _excludeCityId;
uint16[] fetchedCities;
uint16 ii;
address unitedNations;
city[] cities;

  function foo() public {
    
for(uint16 ii = 0; ii < fetchedCities.length; ii++){
address _to = cities[fetchedCities[ii]].owner;
if (_to != 0x0 && fetchedCities[ii] != _excludeCityId) {
balances[_to] = (balances[_to]) + (perCityBoost);
balances[unitedNations] -= perCityBoost;
}

}


  }
}

//#LOOPVARS: ii

contract city { }
