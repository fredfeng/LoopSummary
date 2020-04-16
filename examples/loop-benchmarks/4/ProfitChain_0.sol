
pragma solidity ^0.5.10;



contract C {
  

  uint256 thisBlock;
uint256 lastBlock;
uint256 firstBlock;
Group thisGroup;
address winner;
Round unwonRound;

  function foo() public {
    
for(uint256 thisBlock = firstBlock; thisBlock <= lastBlock; thisBlock = (thisBlock) + (1)){
uint256 latestHash = uint256(block.blockhash(thisBlock));
uint32 drawn = uint32(latestHash % thisGroup.securityFactor);
if (drawn < thisGroup.roundSize) {
winner = unwonRound.investments[drawn].investor;
return;
}

}


  }
}

//#LOOPVARS: thisBlock

contract Group { }

contract Round { }
