
pragma solidity ^0.5.10;



contract C {
  

  uint number;
uint limit;
uint RANGE;
Lot lot;
uint index;

  function foo() public {
    
for(index < limit; index++){
number = uint(keccak256(abi.encodePacked(number))) % RANGE;
lot.tickets[index].number = number;
lot.summaryNumbers = (lot.summaryNumbers) + (number);
}


  }
}

//#LOOPVARS: 

contract Lot { }
