
pragma solidity ^0.5.10;



contract C {
  

  uint j;
mapping(uint => DiscountStep[]) discountSteps;
uint256 _purchasedAmount;
uint256 _purchasedValue;
uint i;
DiscountStruct[] discountStructs;

  function foo() public {
    
for(uint j = 0; j < discountSteps[i].length; j++){
if (_purchasedValue >= discountSteps[i][j].fromWei && (_purchasedValue < discountSteps[i][j].toWei || discountSteps[i][j].toWei == 0)) {
uint256 bonus = _purchasedAmount * discountSteps[i][j].percent / 100;
if ((discountStructs[i].distributedTokens) + (bonus) > discountStructs[i].availableTokens) {
return;
}

return bonus;
}

}


  }
}

//#LOOPVARS: j

contract DiscountStep { }

contract DiscountStruct { }
