
pragma solidity ^0.5.10;



contract C {
  

  uint PERCENT_PRECISION;
uint lastDepositDate;
uint _sum;
uint _startDate;
bytes32 _userKey;
Treasury _treasury;
mapping(uint => Deposit) distributionDeposits;

  function foo() public {
    
for(uint _endDate = lastDepositDate; _startDate <= _endDate && _startDate != 0; _startDate = distributionDeposits[_startDate].nextDepositDate){
Deposit _pendingDeposit = distributionDeposits[_startDate];
Balance _userBalance = _pendingDeposit.leftToWithdraw[_userKey];
if (_userBalance.initialized) {
_sum = (_sum) + (_userBalance.left);
} else {
uint _sharesPercent = _treasury.getSharesPercentForPeriod(_userKey, _startDate);
_sum = (_sum) + (((_pendingDeposit.balance) * (_sharesPercent)) / (PERCENT_PRECISION));
}

}


  }
}

//#LOOPVARS: _endDate

contract Balance { }

contract Deposit { }

contract Treasury { }
