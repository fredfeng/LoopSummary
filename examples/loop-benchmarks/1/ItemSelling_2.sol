
pragma solidity ^0.5.10;



contract C {
  

  address _playerId;
mapping(address => Player) players;
uint256 i;
mapping(uint256 => Item) items;
uint256 value;

  function foo() public {
    
for(uint256 i = 0; i < players[_playerId].ownedItems.length; i++){
value += items[players[_playerId].ownedItems[i]].price;
}


  }
}

//#LOOPVARS: i

contract Item { }

contract Player { }
