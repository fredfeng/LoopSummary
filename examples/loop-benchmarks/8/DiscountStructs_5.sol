
pragma solidity ^0.5.10;



contract C {
  

  uint i;
DiscountStruct[] discountStructs;

  function foo() public {
    
for(uint i = 0; i < discountStructs.length; i++){
if (now >= discountStructs[i].fromDate && now <= discountStructs[i].toDate) {
if (discountStructs[i].distributedTokens >= discountStructs[i].availableTokens) {
return;
}

for (uint j = 0; j < discountSteps[i].length; j++) {
if (_purchasedValue >= discountSteps[i][j].fromWei && (_purchasedValue < discountSteps[i][j].toWei || discountSteps[i][j].toWei == 0)) {
uint256 bonus = _purchasedAmount * discountSteps[i][j].percent / 100;
if (discountStructs[i].distributedTokens.add(bonus) > discountStructs[i].availableTokens) {
return;
}

discountStructs[i].distributedTokens = discountStructs[i].distributedTokens.add(bonus);
emit DiscountStructUsed(i, j, _investor, bonus, now);
return bonus;
}

}

return;
}

}


  }
}

//#LOOPVARS: i

contract DiscountStruct { }
