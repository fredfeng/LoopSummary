
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint[] _totalPlayerTokens;
uint8 totalPlayerAllocationPc;
uint8[] _individualPlayerAllocationPcs;
DividendWinner[] dividendWinners_;
uint dailyDivPrizePool;
uint[] _playerContractIds;

  function foo() public {
    
for(uint8 i = 0; i < _playerContractIds.length; i++){
totalPlayerAllocationPc += _individualPlayerAllocationPcs[i];
uint playerPrizePool = SafeMath.div(SafeMath.mul(dailyDivPrizePool, _individualPlayerAllocationPcs[i]), 100);
uint totalPlayerTokens = _totalPlayerTokens[i];
uint perTokenEthValue = (playerPrizePool) / (totalPlayerTokens);
DividendWinner divWinner = DividendWinner(_playerContractIds[i], perTokenEthValue, totalPlayerTokens, 0);
dividendWinners_.push(divWinner);
}


  }
}

//#LOOPVARS: i

contract DividendWinner { }
