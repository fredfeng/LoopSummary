
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256[]) _validatorApprovals;
mapping(address => mapping(uint256 => uint256)) _validatorApprovalsIndex;
address validator;
mapping(uint256 => AttributeType) _attributeTypes;

  function foo() public {
    
while(_validatorApprovals[validator].length > 0 && gasleft() > 25000){
uint256 lastIndex = (_validatorApprovals[validator].length) - (1);
uint256 targetApproval = _validatorApprovals[validator][lastIndex];
delete _attributeTypes[targetApproval].approvedValidators[validator];
delete _validatorApprovalsIndex[validator][targetApproval];
_validatorApprovals[validator].length--;
}

  }
}

//#LOOPVARS: 

contract address => mappinguint256 { }

contract AttributeType { }
