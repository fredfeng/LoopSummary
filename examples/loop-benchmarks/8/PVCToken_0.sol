
pragma solidity ^0.5.10;



contract C {
  

  address owner;
mapping(address => uint256) balances;
uint[] tokens;
mapping(address => Lockup) lockupParticipants;
address[] teamMembers;
Lockup lockup;
uint i;

  function foo() public {
    
for(uint i = 0; i < teamMembers.length; i++){
tokens[i] = (tokens[i]) * (10 ** 18);
require(teamMembers[i] != address(0));
require(balances[owner] >= tokens[i] && tokens[i] > 0 && (balances[teamMembers[i]]) + (tokens[i]) > balances[teamMembers[i]]);
balances[owner] = (balances[owner]) - (tokens[i]);
balances[teamMembers[i]] = (balances[teamMembers[i]]) + (tokens[i]);
emit Transfer(owner, teamMembers[i], tokens[i]);
lockup = Lockup(now, tokens[i]);
lockupParticipants[teamMembers[i]] = lockup;
}


  }
}

//#LOOPVARS: i

contract Lockup { }
