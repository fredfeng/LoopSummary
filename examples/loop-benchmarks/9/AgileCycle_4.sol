
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => FutureDeal) futureDeals;
uint _startLoop;
bool requireTokens;
AgileCycle cycle;
uint _balanceTokens;
uint _promisedTokens;
uint _endLoop;
address[] investorList;
uint i;

  function foo() public {
    
for(uint i = _startLoop; i < _endLoop; i++){
address _investor = investorList[i];
uint _etherAmount = futureDeals[_investor].etherAmount;
uint _tokenAmount = futureDeals[_investor].tokenAmount;
_promisedTokens += _tokenAmount;
if (requireTokens) require(_balanceTokens >= _promisedTokens);

cycle.offerAccepted.value(_etherAmount)(_investor, _tokenAmount);
futureDeals[_investor].etherAmount = 0;
futureDeals[_investor].tokenAmount = 0;
}


  }
}

//#LOOPVARS: i

contract AgileCycle { }

contract FutureDeal { }
