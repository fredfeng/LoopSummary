
pragma solidity ^0.5.10;



contract C {
  

  Potato[] potatoes;
uint256 START_PRICE;
uint i;
uint256 NUM_POTATOES;

  function foo() public {
    
for(uint i = 0; i < NUM_POTATOES; i++){
Potato newpotato = Potato(address(this), START_PRICE);
potatoes.push(newpotato);
}


  }
}

//#LOOPVARS: i

contract Potato { }
