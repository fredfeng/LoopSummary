
pragma solidity ^0.5.10;



contract C {
  

  uint256 _threshold;
mapping(address => uint256[]) addressTransactions;
bytes _whitelistSign;
uint256 _amount;
uint256 i;
address _investor;
bool _whitelisted;
mapping(uint256 => Deposit) transactions;

  function foo() public {
    
for(uint256 i = 0; i < addressTransactions[_investor].length; i++){
_amount = (_amount) + (transactions[addressTransactions[_investor][i]].amount);
if (_whitelisted || _threshold >= _amount) {
forwardTransactionInternal(addressTransactions[_investor][i], _whitelistSign);
}

}


  }
}

//#LOOPVARS: i

contract Deposit { }
