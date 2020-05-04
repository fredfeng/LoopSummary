






contract C {
  

  

  mapping(address => bool) isWorldCupTeam;
uint numOfTeam;
address[] _teams;

  function foo() public {
    
for(uint i = 0; i < _teams.length; i++){
if (!isWorldCupTeam[_teams[i]]) numOfTeam++;

isWorldCupTeam[_teams[i]] = true;
}


  }

  

}

//#LOOPVARS: i


