
pragma solidity ^0.5.10;



contract C {
  

  address[] yourChoices;
AddressCard[] _addressCards;
mapping(address => bool) _exists;
mapping(address => uint256) _indexOf;
uint256 i;
address[] opponentsChoices;
uint256[][] allAttackFigures;
AddressCard[][] allCards;
uint256[][] allDefenceFigures;

  function foo() public {
    
for(uint256 i = 0; i < 3; i++){
require(_exists[yourChoices[i]]);
allCards[0][i] = _addressCards[_indexOf[yourChoices[i]]];
allAttackFigures[0][i] = allCards[0][i]._attack;
allDefenceFigures[0][i] = allCards[0][i]._defence;
require(_exists[opponentsChoices[i]]);
allCards[1][i] = _addressCards[_indexOf[opponentsChoices[i]]];
allAttackFigures[1][i] = allCards[1][i]._attack;
allDefenceFigures[1][i] = allCards[1][i]._defence;
}


  }
}

//#LOOPVARS: i

contract AddressCard { }
