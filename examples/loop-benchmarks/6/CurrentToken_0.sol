
pragma solidity ^0.5.10;



contract C {
  

  CurrentToken token;
uint256 distributionPreIcoCount;
uint256 i;
uint256 count;
uint256 _paginationCount;
uint256 tokensSoldTotal;
uint256 exchangeRatePreIco;

  function foo() public {
    
for(uint256 i = distributionPreIcoCount; i < getPreIcoInvestorsCount(); i++){
if (count == _paginationCount) {
break;
}

uint256 investment = getPreIcoInvestment(getPreIcoInvestor(i));
uint256 tokensAmount = (investment) * (exchangeRatePreIco);
tokensSoldTotal = (tokensSoldTotal) + (tokensAmount);
token.transferFromIco(getPreIcoInvestor(i), tokensAmount);
count++;
}


  }
}

//#LOOPVARS: i

contract CurrentToken { }
