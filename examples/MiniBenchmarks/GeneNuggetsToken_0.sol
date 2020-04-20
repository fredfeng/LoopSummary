
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint[] MINING_LAYERS;
uint _userAmount;
uint tokenAmount;
uint[] MINING_REWARDS;

  function foo() public {
    
for(uint8 i = 0; i < MINING_LAYERS.length; i++){
if (_userAmount < MINING_LAYERS[i + 1]) {
tokenAmount = (tokenAmount) + ((MINING_REWARDS[i]) * ((_userAmount) - (MINING_LAYERS[i])));
break;
} else {
tokenAmount = (tokenAmount) + ((MINING_REWARDS[i]) * ((MINING_LAYERS[i + 1]) - (MINING_LAYERS[i])));
}

}


  }
}

//#LOOPVARS: i
