
pragma solidity ^0.5.10;



contract C {
  

  uint256 AVAILABLE_WHITE_LISTING_SUPPLY;
address[] _recipients;
mapping(address => mapping(uint8 => Allocation)) allocations;
AllocationType _bonusType;
uint256 addressIndex;
uint256 AVAILABLE_TOTAL_SUPPLY;
uint256 decimalFactor;
uint256 AVAILABLE_BOUNTY_SUPPLY;
uint256 AVAILABLE_REFERRAL_SUPPLY;
uint256[] _amounts;
uint256 AVAILABLE_AIRDROP_SUPPLY;

  function foo() public {
    
for(uint256 addressIndex = 0; addressIndex < _recipients.length; addressIndex++){
address recipient = _recipients[addressIndex];
uint256 amount = _amounts[addressIndex] * decimalFactor;
if (_bonusType == AllocationType.BOUNTY) {
AVAILABLE_BOUNTY_SUPPLY = (AVAILABLE_BOUNTY_SUPPLY) - (amount);
} else if (_bonusType == AllocationType.AIRDROP) {
AVAILABLE_AIRDROP_SUPPLY = (AVAILABLE_AIRDROP_SUPPLY) - (amount);
} else if (_bonusType == AllocationType.WHITE_LISTING) {
AVAILABLE_WHITE_LISTING_SUPPLY = (AVAILABLE_WHITE_LISTING_SUPPLY) - (amount);
} else if (_bonusType == AllocationType.REFERRAL) {
AVAILABLE_REFERRAL_SUPPLY = (AVAILABLE_REFERRAL_SUPPLY) - (amount);
}




uint256 newAmount = (allocations[recipient][uint8(_bonusType)].totalAllocated) + (amount);
allocations[recipient][uint8(_bonusType)] = Allocation(newAmount, allocations[recipient][uint8(_bonusType)].amountClaimed);
AVAILABLE_TOTAL_SUPPLY = (AVAILABLE_TOTAL_SUPPLY) - (amount);
}


  }
}

//#LOOPVARS: addressIndex

contract Allocation { }

contract AllocationType { }

contract address => mappinguint8 { }
