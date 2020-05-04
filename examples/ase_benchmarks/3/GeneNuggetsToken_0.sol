






contract C {
  

  

  uint tokenAmount;
uint[] MINING_REWARDS;
uint[] MINING_LAYERS;
uint _userAmount;

  function foo() public {
    
for(uint8 i = 0; i < MINING_LAYERS.length; i++){
if (_userAmount < MINING_LAYERS[i + 1]) {
tokenAmount = ((tokenAmount) + (((MINING_REWARDS[i]) * (((_userAmount) - (MINING_LAYERS[i]))))));
break;
} else {
tokenAmount = ((tokenAmount) + (((MINING_REWARDS[i]) * (((MINING_LAYERS[i + 1]) - (MINING_LAYERS[i]))))));
}

}


  }

  

}

//#LOOPVARS: i


