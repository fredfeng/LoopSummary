
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _fromWei;
uint256[] _percent;
mapping(uint => DiscountStep[]) discountSteps;
uint index;
uint256[] _toWei;
uint i;

  function foo() public {
    
for(uint i = 0; i < _fromWei.length; i++){
require(_fromWei[i] > 0 || _toWei[i] > 0);
require(_percent[i] > 0);
discountSteps[index].push(DiscountStep(_fromWei[i], _toWei[i], _percent[i]));
}


  }
}

//#LOOPVARS: i

contract DiscountStep { }
