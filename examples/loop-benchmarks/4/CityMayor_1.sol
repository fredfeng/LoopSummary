
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256 perCityBoost;
uint16[] fetchedCities;
uint16 ii;
uint256 totalSupply_;
city[] cities;

  function foo() public {
    
for(uint16 ii = 0; ii < fetchedCities.length; ii++){
address _to = cities[fetchedCities[ii]].owner;
if (_to != 0x0) {
balances[_to] = (balances[_to]) + (perCityBoost);
totalSupply_ += perCityBoost;
}

}


  }
}

//#LOOPVARS: ii

contract city { }
