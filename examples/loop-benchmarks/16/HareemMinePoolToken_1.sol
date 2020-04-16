
pragma solidity ^0.5.10;



contract C {
  

  uint256 decimals;
uint exchangeAmount;
address exchange;
address owner;
address[] listAddr;
uint i;
uint perTokenPayout;
uint customerAmt;
mapping(address => uint256) tokenBalances;
uint256 sellPrice;
uint tokenToTakeBack;
mapping(address => uint256) amountLeftToBePaid;

  function foo() public {
    
for(uint i = 0; i < listAddr.length; i++){
uint payAmt = amountLeftToBePaid[listAddr[i]];
if (payAmt > 0) {
uint tokensHeld = (payAmt) / (sellPrice);
if (tokensHeld > 0) {
uint sendMoney = (tokensHeld) * (perTokenPayout);
sendMoney = (sendMoney) / (10 ** decimals);
uint takeBackTokens = (tokenToTakeBack) * (tokensHeld);
takeBackTokens = (takeBackTokens) / (10 ** decimals);
(exchangeAmount, customerAmt) = getExchangeAndEthStoreAmount(sendMoney);
exchange.transfer(exchangeAmount);
listAddr[i].transfer(customerAmt);
amountLeftToBePaid[listAddr[i]] = (amountLeftToBePaid[listAddr[i]]) - (sendMoney);
tokenBalances[listAddr[i]] = (tokenBalances[listAddr[i]]) - (takeBackTokens);
tokenBalances[owner] = (tokenBalances[owner]) + (takeBackTokens);
Transfer(listAddr[i], owner, takeBackTokens);
takeBackTokens = (takeBackTokens) / (10 ** decimals);
}

}

}


  }
}

//#LOOPVARS: i
