
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint16[] chances;
uint16[] addedUpChances;
uint256 _randomNumber;

  function foo() public {
    
for(uint8 i = 0; i < uint8(chances.length); i++){
if (_randomNumber < addedUpChances[i]) {
return correctedIndex(i);
}

}


  }
}

//#LOOPVARS: i
