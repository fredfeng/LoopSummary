
pragma solidity ^0.5.10;



contract C {
  

  address[] playerList;
uint256 lastDividendsAmount;
mapping(address => Player) players;
uint256 i;
uint256 totalCurrentVolume;
uint256 userDividens;
uint256 userVolume;

  function foo() public {
    
for(uint256 i = 0; i < playerList.length; i++){
userVolume = calculatePlayerValue(playerList[i]);
players[playerList[i]].lastPayedDividends = 0;
if (userVolume > 0) {
userDividens = ((userVolume) * (lastDividendsAmount)) / (totalCurrentVolume);
players[playerList[i]].lastPayedDividends = userDividens;
addPlayerTxHistory(playerList[i], players[playerList[i]].ownedItems.length, userDividens, 2, now);
emit Dividends(playerList[i], userDividens);
playerList[i].transfer(userDividens);
}

userVolume = 0;
userDividens = 0;
}


  }
}

//#LOOPVARS: i

contract Player { }
