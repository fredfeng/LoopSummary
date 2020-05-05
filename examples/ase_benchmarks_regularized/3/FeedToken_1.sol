






contract C {
  

  

  mapping(address => uint) teamMembers;
mapping(address => uint256) tokenBalances;
uint oneTeamMemberShare;
address owner;
address[] members;

  function foo() public {
    
for(uint i = 0; i < members.length; i++){
teamMembers[members[i]] = oneTeamMemberShare;
tokenBalances[owner] = ((tokenBalances[owner]) - (oneTeamMemberShare));
tokenBalances[members[i]] = ((tokenBalances[members[i]]) + (oneTeamMemberShare));

}


  }

  

}

//#LOOPVARS: i


