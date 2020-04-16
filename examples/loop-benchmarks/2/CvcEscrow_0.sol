
pragma solidity ^0.5.10;



contract C {
  

  bytes32[] _credentialItemIds;
address _idv;
uint256 i;
uint256 price;
uint256 credentialItemPrice;
CvcPricingInterface cvcPricing;

  function foo() public {
    
for(uint256 i = 0; i < _credentialItemIds.length; i++){
(credentialItemPrice) = cvcPricing.getPriceByCredentialItemId(_idv, _credentialItemIds[i]);
price = (price) + (credentialItemPrice);
}


  }
}

//#LOOPVARS: i

contract CvcPricingInterface { }
