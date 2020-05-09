






contract C {
  

  

  mapping(address => uint256) mapIcedBalancesReserveAndTeamFrosted;
uint256 DEFROST_FACTOR_TEAMANDADV;
address[] icedBalancesReserveAndTeam;
mapping(address => uint256) balances;
uint256 monthsIndex;
mapping(address => uint256) mapIcedBalancesReserveAndTeamDefrosted;

  function foo() public {
    
for(uint256 index = 0; index < icedBalancesReserveAndTeam.length; index++){
address currentAddress = icedBalancesReserveAndTeam[index];
uint256 amountTotal = ((mapIcedBalancesReserveAndTeamFrosted[currentAddress]) + (mapIcedBalancesReserveAndTeamDefrosted[currentAddress]));
uint256 targetDefrosted = ((((monthsIndex) * (amountTotal))) / (DEFROST_FACTOR_TEAMANDADV));
uint256 amountToRelease = ((targetDefrosted) - (mapIcedBalancesReserveAndTeamDefrosted[currentAddress]));
if (amountToRelease > 0) {
mapIcedBalancesReserveAndTeamFrosted[currentAddress] = ((mapIcedBalancesReserveAndTeamFrosted[currentAddress]) - (amountToRelease));
mapIcedBalancesReserveAndTeamDefrosted[currentAddress] = ((mapIcedBalancesReserveAndTeamDefrosted[currentAddress]) + (amountToRelease));
balances[currentAddress] = ((balances[currentAddress]) + (amountToRelease));


}

}


  }

  

}

//#LOOPVARS: index


