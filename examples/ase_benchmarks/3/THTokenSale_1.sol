






contract C {
  

  

  uint256 tokensTeam;
uint256[] teamTokenAllocation;
uint256 crowdsaleTokens;
uint amount;
uint256 _crowdsaleAllocation;
uint256[] vestedTeam;
uint len;

  function foo() public {
    
for(uint i = 0; i < len; i++){
amount = ((((crowdsaleTokens) * (teamTokenAllocation[i]))) / (_crowdsaleAllocation));
vestedTeam[i] = amount;
tokensTeam = ((tokensTeam) + (amount));
}


  }

  

}

//#LOOPVARS: i


