
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256[]) balances;
uint256[] _counts;
address _from;
uint256[] _cardIds;
address _to;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _cardIds.length; i++){
uint256 _cardId = _cardIds[i];
uint256 _count = _counts[i];
require(_count > 0);
require(_count <= balances[_from][_cardId]);
balances[_from][_cardId] = (balances[_from][_cardId]) - (_count);
balances[_to][_cardId] = (balances[_to][_cardId]) + (_count);
emit Transfer(_from, _to, _cardId, _count);
}


  }
}

//#LOOPVARS: i
