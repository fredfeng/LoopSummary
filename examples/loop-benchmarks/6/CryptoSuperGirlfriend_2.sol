
pragma solidity ^0.5.10;



contract C {
  

  uint256 k;
uint256[] sellPrices;
address _owner;
uint256 i;
uint256[] listedItems;
uint256[] items;
uint256[] prices;
address[] owners;

  function foo() public {
    
for(uint256 i = 0; i < listedItems.length; i++){
if (ownerOf(listedItems[i]) == _owner) {
items[k] = listedItems[i];
owners[k] = ownerOf(listedItems[i]);
prices[k] = priceOf(listedItems[i]);
sellPrices[k] = sellPriceOf(listedItems[i]);
k++;
}

}


  }
}

//#LOOPVARS: i
