
pragma solidity ^0.5.10;



contract C {
  

  PlayerToken[] playerTokenContracts_;
uint endIndex;
uint startIndex;
uint i;

  function foo() public {
    
for(uint i = startIndex; i < endIndex; i++){
PlayerToken playerTokenContract = playerTokenContracts_[i];
if (!playerTokenContract.paused()) {
playerTokenContract.pause();
}

}


  }
}

//#LOOPVARS: i

contract PlayerToken { }
