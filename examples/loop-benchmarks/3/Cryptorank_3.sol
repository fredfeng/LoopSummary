
pragma solidity ^0.5.10;



contract C {
  

  address[] players;
mapping(address => uint256) selfharvest;
uint256 i;
mapping(address => uint256) selfvotes;
mapping(uint256 => Round) rounds;
uint256 reward;
uint256 roundid;

  function foo() public {
    
for(uint256 i = 0; i < players.length; i++){
address player = players[i];
uint256 backreward = ((reward) * (selfvotes[player])) / (rounds[roundid].tickets);
selfharvest[player] = (selfharvest[player]) + (backreward);
}


  }
}

//#LOOPVARS: i

contract Round { }
