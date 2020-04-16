
pragma solidity ^0.5.10;



contract C {
  

  address[] directInvestorsCollection;
bool refundingComplete;
uint256 refundingIndex;
RefundVault vault;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < 20; i++){
if (refundingIndex >= directInvestorsCollection.length) {
refundingComplete = true;
break;
}

vault.refund(directInvestorsCollection[refundingIndex]);
refundingIndex = (refundingIndex) + (1);
}


  }
}

//#LOOPVARS: i

contract RefundVault { }
