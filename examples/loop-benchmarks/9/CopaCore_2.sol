
pragma solidity ^0.5.10;



contract C {
  

  uint256 packSize;
address _buyer;
uint256 i;
uint256 _count;
mapping(address => PackBuy[]) packBuys;
uint256 packPrice;

  function foo() public {
    
for(uint256 i = 0; i < _count; i++){
uint256[] _cardsList = new uint256[](packSize);
for (uint256 j = 0; j < packSize; j++) {
uint256 _cardId = dice(totalCardCount);
balances[_buyer][_cardId] = balances[_buyer][_cardId].add(1);
_cardsList[j] = _cardId;
emit Transfer(0x0, _buyer, _cardId, 1);
}

uint256 _id = packBuys[_buyer].length;
packBuys[_buyer].push(PackBuy(packSize, packPrice, _cardsList));
emit BuyPack(_id, _buyer, packSize, packPrice, _cardsList);
}


  }
}

//#LOOPVARS: i

contract PackBuy { }
