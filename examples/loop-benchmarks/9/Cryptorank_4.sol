
pragma solidity ^0.5.10;



contract C {
  

  address[] players;
uint256 roundid;
mapping(address => uint256) selfharvest;
mapping(address => uint256) selfvoteamount;
mapping(address => uint256) selfcommission;
mapping(address => uint256) selfvotes;
mapping(uint256 => Round) rounds;
uint256 reward;
mapping(address => uint256) selfpotprofit;
uint i;

  function foo() public {
    
for(uint i = 0; i < players.length; i++){
address player = players[i];
uint256 selfbalance = selfcommission[msg.sender] + selfharvest[msg.sender] + selfpotprofit[msg.sender];
uint256 endreward = ((((reward) * (42)) / (100)) * (selfvotes[player])) / (rounds[roundid].tickets);
selfcommission[player] = 0;
selfharvest[player] = 0;
selfpotprofit[player] = 0;
selfvoteamount[player] = 0;
selfvotes[player] = 0;
player.transfer((endreward) + (selfbalance));
}


  }
}

//#LOOPVARS: i

contract Round { }
