
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalWeightedContribution;
FirstBuyer buyer;
uint256 i;
uint256 iterate;
uint256 amount;
mapping(uint256 => uint256) transactions;

  function foo() public {
    
for(uint256 i = buyer.lastTransactionIndex; i < iterate; i++){
uint256 ratio = ((((buyer.weightedContribution) * (10 ** 14))) / (totalWeightedContribution));
amount = (amount) + ((((transactions[buyer.lastTransactionIndex]) * (ratio))) / (10 ** 14));
buyer.lastTransactionIndex = (buyer.lastTransactionIndex) + (1);
}


  }
}

//#LOOPVARS: i

contract FirstBuyer { }
