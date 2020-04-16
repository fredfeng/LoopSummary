
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 stake;
address[] fighterAddressess;
address _betterAddress;
mapping(address => mapping(address => Bet)) bets;

  function foo() public {
    
for(uint8 i = 0; i < fighterAddressess.length; i++){
if (bets[fighterAddressess[i]][_betterAddress].stake > 0 && !bets[fighterAddressess[i]][_betterAddress].withdrawn) {
bets[fighterAddressess[i]][_betterAddress].withdrawn = true;
stake = (stake) + (bets[fighterAddressess[i]][_betterAddress].stake);
}

}


  }
}

//#LOOPVARS: i

contract Bet { }

contract address => mappingaddress { }
