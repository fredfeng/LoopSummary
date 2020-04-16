
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
uint256 multiplier;
mapping(address => uint256) balance;
address[] tokenHolders;
uint256 volume;
uint256 dividendPayment;
uint i;

  function foo() public {
    
for(uint i = 0; i < ((tokenHolders.length) - (1)); i++){
address payee = getTokenHolder(i);
uint256 stake = (volume) / ((dividendPayment) / (multiplier));
uint256 dividendPayout = ((balanceOf(payee)) / (stake)) * (multiplier);
balance[payee] = (balance[payee]) + (dividendPayout);
totalSupply = (totalSupply) + (dividendPayout);
Transfer(0, payee, dividendPayout);
}


  }
}

//#LOOPVARS: i
