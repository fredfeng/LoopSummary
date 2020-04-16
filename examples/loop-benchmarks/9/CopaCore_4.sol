
pragma solidity ^0.5.10;



contract C {
  

  uint256 packSize;
address owner;
uint256 i;
uint256 _count;
mapping(address => PackBuy[]) packBuys;

  function foo() public {
    
for(uint256 i = 0; i < _count; i++){
uint256[] _cardsList = new uint256[](packSize);
for (uint256 j = 0; j < packSize; j++) {
uint256 _cardId = dice(totalCardCount);
balances[owner][_cardId] = balances[owner][_cardId].add(1);
_cardsList[j] = _cardId;
emit Transfer(0x0, owner, _cardId, 1);
}

uint256 _id = packBuys[owner].length;
packBuys[owner].push(PackBuy(packSize, 0, _cardsList));
emit BuyPack(_id, owner, packSize, 0, _cardsList);
}


  }
}

//#LOOPVARS: i

contract PackBuy { }
