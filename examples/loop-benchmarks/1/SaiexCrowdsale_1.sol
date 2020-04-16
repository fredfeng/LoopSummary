
pragma solidity ^0.5.10;



contract C {
  

  Bonus[] amountBonus;
uint i;
uint256 rate;
uint256 _weiAmount;

  function foo() public {
    
for(i = 0; i < amountBonus.length; i++){
if ((_weiAmount) * (rate) >= amountBonus[i].timeOrAmount) {
return amountBonus[i].rateMultiplier;
}

}


  }
}

//#LOOPVARS: i

contract Bonus { }
