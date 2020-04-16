
pragma solidity ^0.5.10;



contract C {
  

  uint32[] BONUS_AMOUNTS_VALUES;
uint128[] BONUS_AMOUNTS;
uint256 weiAmount;
uint i;

  function foo() public {
    
for(uint i = 0; i < BONUS_AMOUNTS.length; i++){
if (weiAmount >= BONUS_AMOUNTS[i]) {
return BONUS_AMOUNTS_VALUES[i];
}

}


  }
}

//#LOOPVARS: i
