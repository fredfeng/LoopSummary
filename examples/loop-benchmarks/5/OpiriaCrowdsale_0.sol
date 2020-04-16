
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => uint256) bonusOf;
uint256 totalBonus;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
if (bonusOf[addresses[i]] > 0) {
uint256 bonusAmount = bonusOf[addresses[i]];
_deliverTokens(addresses[i], bonusAmount);
totalBonus = (totalBonus) - (bonusAmount);
bonusOf[addresses[i]] = 0;
}

}


  }
}

//#LOOPVARS: i
