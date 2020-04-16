
pragma solidity ^0.5.10;



contract C {
  

  address[] _winners;
uint[] _tokenAllocation;
mapping(address => uint256) addressToDividendBalance;
DividendWinner divWinner;
uint totalTokensAllocatedEth;
address winner;
uint ethAllocation;
uint totalEthAssigned;
uint i;

  function foo() public {
    
for(uint i = 0; i < _winners.length; i++){
winner = _winners[i];
ethAllocation = (_tokenAllocation[i]) * (divWinner.perTokenEthValue);
addressToDividendBalance[winner] = (addressToDividendBalance[winner]) + (ethAllocation);
totalTokensAllocatedEth = (totalTokensAllocatedEth) + (_tokenAllocation[i]);
totalEthAssigned = (totalEthAssigned) + (ethAllocation);
}


  }
}

//#LOOPVARS: i

contract DividendWinner { }
