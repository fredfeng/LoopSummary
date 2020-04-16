
pragma solidity ^0.5.10;



contract C {
  

  address owner;
mapping(address => uint256) balances;
uint[] tokens;
mapping(address => Lockup) lockupParticipants;
Lockup lockup;
uint i;
address[] advisors;

  function foo() public {
    
for(uint i = 0; i < advisors.length; i++){
tokens[i] = (tokens[i]) * (10 ** 18);
require(advisors[i] != address(0));
require(balances[owner] >= tokens[i] && tokens[i] > 0 && (balances[advisors[i]]) + (tokens[i]) > balances[advisors[i]]);
balances[owner] = (balances[owner]) - (tokens[i]);
balances[advisors[i]] = (balances[advisors[i]]) + (tokens[i]);
emit Transfer(owner, advisors[i], tokens[i]);
lockup = Lockup(now, tokens[i]);
lockupParticipants[advisors[i]] = lockup;
}


  }
}

//#LOOPVARS: i

contract Lockup { }
