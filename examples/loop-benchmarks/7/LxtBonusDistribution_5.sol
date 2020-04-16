
pragma solidity ^0.5.10;



contract C {
  

  address LXT_OWNER;
address[] _recipients;
uint256 addressIndex;
AllocationType _bonusType;
LexitToken LXT;
uint256 grandTotalClaimed;
mapping(address => mapping(uint8 => Allocation)) allocations;

  function foo() public {
    
for(uint256 addressIndex = 0; addressIndex < _recipients.length; addressIndex++){
address recipient = _recipients[addressIndex];
Allocation allocation = allocations[recipient][uint8(_bonusType)];
if (allocation.totalAllocated > 0) {
uint256 amount = (allocation.totalAllocated) - (allocation.amountClaimed);
require(LXT.transferFrom(LXT_OWNER, recipient, amount));
allocation.amountClaimed = (allocation.amountClaimed) + (amount);
grandTotalClaimed = (grandTotalClaimed) + (amount);
}

}


  }
}

//#LOOPVARS: addressIndex

contract Allocation { }

contract AllocationType { }

contract address => mappinguint8 { }

contract LexitToken { }
