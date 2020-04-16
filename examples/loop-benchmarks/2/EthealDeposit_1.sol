
pragma solidity ^0.5.10;



contract C {
  

  uint256 _threshold;
EthealWhitelist whitelist;
iEthealSale sale;
uint256 i;
uint256[] _ids;
mapping(uint256 => Deposit) transactions;

  function foo() public {
    
for(uint256 i = 0; i < _ids.length; i++){
if (whitelist.isWhitelisted(transactions[_ids[i]].beneficiary) || _threshold >= (sale.stakes(transactions[_ids[i]].beneficiary)) + (transactions[_ids[i]].amount)) {
forwardTransactionInternal(_ids[i], "");
}

}


  }
}

//#LOOPVARS: i

contract iEthealSale { }

contract EthealWhitelist { }

contract Deposit { }
