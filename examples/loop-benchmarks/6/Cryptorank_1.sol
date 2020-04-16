
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
mapping(string => uint) cvotes;
Coin[] coinSorting;
uint256 i;

  function foo() public {
    
for(uint256 j = i + 1; j < coinSorting.length; j++){
if (coinSorting[i].votes < coinSorting[j].votes) {
cvotes[coinSorting[i].name] = j;
cvotes[coinSorting[j].name] = i;
Coin temp = Coin(coinSorting[i].symbol, coinSorting[i].name, coinSorting[i].votes);
coinSorting[i] = Coin(coinSorting[j].symbol, coinSorting[j].name, coinSorting[j].votes);
coinSorting[j] = Coin(temp.symbol, temp.name, temp.votes);
}

}


  }
}

//#LOOPVARS: j

contract string { }

contract Coin { }
