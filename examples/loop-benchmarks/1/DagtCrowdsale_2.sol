
pragma solidity ^0.5.10;



contract C {
  

  uint256 _weiAmount;
uint256[] BONUS_AMOUNTS;
uint i;
uint32[] BONUS_AMOUNTS_VALUES;

  function foo() public {
    
for(uint i = 0; i < BONUS_AMOUNTS.length; i++){
if (_weiAmount >= BONUS_AMOUNTS[i]) {
return BONUS_AMOUNTS_VALUES[i];
}

}


  }
}

//#LOOPVARS: i
