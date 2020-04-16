
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
mapping(address => mapping(uint8 => Allocation)) allocations;
AllocationType _bonusType;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(_recipients[i] != address(0));
require(allocations[_recipients[i]][uint8(_bonusType)].amountClaimed < allocations[_recipients[i]][uint8(_bonusType)].totalAllocated);
}


  }
}

//#LOOPVARS: i

contract Allocation { }

contract AllocationType { }

contract address => mappinguint8 { }
