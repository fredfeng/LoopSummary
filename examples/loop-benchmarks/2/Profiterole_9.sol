
pragma solidity ^0.5.10;



contract C {
  

  uint _endDate;
uint lastDepositDate;
uint _startDate;
uint _value;
bytes32 _userKey;
Treasury _treasury;
mapping(uint => Deposit) distributionDeposits;

  function foo() public {
    
for(uint _endDate = lastDepositDate; _startDate <= _endDate && _startDate != 0 && _value > 0; _startDate = distributionDeposits[_startDate].nextDepositDate){
uint _balanceToWithdraw = _withdrawBonusesFromDeposit(_userKey, _startDate, _value, _treasury);
_value = (_value) - (_balanceToWithdraw);
}


  }
}

//#LOOPVARS: _endDate

contract Deposit { }

contract Treasury { }
