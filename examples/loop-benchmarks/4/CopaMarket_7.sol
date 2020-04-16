
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256[]) balances;
uint256 totalCardCount;
uint256 packSize;
address owner;
uint256 j;
uint256[] _cardsList;

  function foo() public {
    
for(uint256 j = 0; j < packSize; j++){
uint256 _cardId = dice(totalCardCount);
balances[owner][_cardId] = (balances[owner][_cardId]) + (1);
_cardsList[j] = _cardId;
emit Transfer(0x0, owner, _cardId, 1);
}


  }
}

//#LOOPVARS: j
