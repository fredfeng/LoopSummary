
pragma solidity ^0.5.10;



contract C {
  

  uint256 idStart;
uint256 _take;
uint256 _from;
uint256[] sellPrices;
uint256 i;
uint256[] items;
uint256[] prices;

  function foo() public {
    
for(uint256 i = _from; i < (_from) + (_take); i++){
uint256 j = i - _from;
items[j] = idStart + i;
prices[j] = priceOf(idStart + i);
sellPrices[j] = sellPriceOf(idStart + i);
}


  }
}

//#LOOPVARS: i
