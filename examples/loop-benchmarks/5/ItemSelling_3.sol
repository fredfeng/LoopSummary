
pragma solidity ^0.5.10;



contract C {
  

  address _playerId;
uint[] _types;
uint playerHistoryMaxSize;
mapping(address => Player) players;
uint256[] _prices;
uint256[] _itemIds;
uint offset;
uint i;
uint[] _ts;

  function foo() public {
    
for(uint i = 0; i < playerHistoryMaxSize; i++){
_itemIds[i] = players[_playerId].txHistory[offset].itemId;
_prices[i] = players[_playerId].txHistory[offset].price;
_types[i] = players[_playerId].txHistory[offset].txType;
_ts[i] = players[_playerId].txHistory[offset].timestamp;
offset = offset > 0 ? offset - 1, playerHistoryMaxSize - 1;
}


  }
}

//#LOOPVARS: i

contract Player { }
