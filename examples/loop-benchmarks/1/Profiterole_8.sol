
pragma solidity ^0.5.10;



contract C {
  

  uint _amount;
uint _startDate;
uint _lastDepositDate;
mapping(uint => Deposit) distributionDeposits;
uint firstDepositDate;

  function foo() public {
    
for(uint _startDate = firstDepositDate; _startDate <= _lastDepositDate || _startDate != 0; _startDate = distributionDeposits[_startDate].nextDepositDate){
_amount = (_amount) + (distributionDeposits[_startDate].left);
}


  }
}

//#LOOPVARS: _startDate

contract Deposit { }
