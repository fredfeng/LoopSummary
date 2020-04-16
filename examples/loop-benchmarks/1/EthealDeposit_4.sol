
pragma solidity ^0.5.10;



contract C {
  

  address _investor;
uint256 i;
mapping(address => uint256[]) addressTransactions;

  function foo() public {
    
for(uint256 i = 0; i < addressTransactions[_investor].length; i++){
refundTransactionInternal(addressTransactions[_investor][i]);
}


  }
}

//#LOOPVARS: i
