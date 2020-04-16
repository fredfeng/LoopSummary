
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => Country) countryData;
uint256 i;
uint256 poolTotal;
uint256 owed;
uint256[] countrys;

  function foo() public {
    
for(uint256 i = 0; i < countrys.length; i++){
uint256 totalCountryOwed = poolTotal * countryData[countrys[i]].payout / 10000;
uint256 countryOwed = (totalCountryOwed) - (countryData[countrys[i]].withdrawn);
owed += countryOwed;
countryData[countrys[i]].withdrawn += countryOwed;
}


  }
}

//#LOOPVARS: i

contract Country { }
