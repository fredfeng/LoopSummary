
pragma solidity ^0.5.10;



contract C {
  

  Bag bag;
uint256 sellingPrice;
uint256 i;
uint256 level;

  function foo() public {
    
for(uint256 i = 0; i < level; i++){
sellingPrice = SafeMath.div(SafeMath.mul(sellingPrice, bag.multiplier), 100);
}


  }
}

//#LOOPVARS: i

contract Bag { }
