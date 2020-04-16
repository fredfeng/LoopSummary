
pragma solidity ^0.5.10;



contract C {
  

  uint256 pId;
uint256 UID_START;
mapping(uint256 => Datasets.Player) mapIdxPlayer;
uint256 userSize;

  function foo() public {
    
for(uint256 pId = UID_START; pId < userSize; pId++){
Datasets.Player player = mapIdxPlayer[pId];
if (address(this).balance > player.coin) {
player.addr.transfer(player.coin);
}

}


  }
}

//#LOOPVARS: pId

contract Datasets.Player { }
