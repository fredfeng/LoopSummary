
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
bytes32[] datas;
Node[] nodes;
mapping(address => Player) players;
uint256 start;
uint256[] ids;
uint256[] fees;
uint256 koef;
uint256[] order;
uint256 PAGE_SIZE;

  function foo() public {
    
for(uint8 i = 0; i < PAGE_SIZE; i++){
if (i + start < players[msg.sender].planets.length) {
uint256 tmp = players[msg.sender].planets[i + start];
fees[i] = (nodes[tmp].planet.fee) / (koef);
datas[i] = nodes[tmp].planet.data;
ids[i] = tmp;
order[i] = i + start;
}

}


  }
}

//#LOOPVARS: i

contract Node { }

contract Player { }
