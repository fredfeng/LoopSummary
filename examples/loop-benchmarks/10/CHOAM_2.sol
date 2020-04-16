
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => Player) players;
uint256 koef;
uint256 id;
Node[] nodes;

  function foo() public {
    
while(true){
id = nodes[id].next;
if (nodes[id].planet.owner == address(0)) {
players[msg.sender].position = id;
break;
} else if (nodes[id].planet.owner == msg.sender) {
players[msg.sender].position = id;
} else {
uint256 fee = (nodes[id].planet.fee) / (koef);
if (fee > players[msg.sender].balance) break;

players[msg.sender].balance = (players[msg.sender].balance) - (fee);
players[nodes[id].planet.owner].balance = (players[nodes[id].planet.owner].balance) + (fee);
players[msg.sender].position = id;
}


}

  }
}

//#LOOPVARS: 

contract Player { }

contract Node { }
