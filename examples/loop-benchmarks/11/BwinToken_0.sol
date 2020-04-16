
pragma solidity ^0.5.10;



contract C {
  

  uint256 _sended;
uint256 _amount;
User user;
uint256 _sharePercent;
uint i;

  function foo() public {
    
for(uint i = 0; i < user.getShareHolderCount(); i++){
address _wallet;
uint256 _percent;
bool _contract;
emit ProcessShares(_amount, i, _percent, _contract, _wallet);
assert(_percent <= 1000);
(_wallet, _percent, _contract) = user.getShareHolder(i);
uint256 _value;
bool _valueOk;
(_value, _valueOk) = processFunds(_wallet, _amount, _percent, _contract);
_sharePercent = (_sharePercent) + (_percent);
_sended = (_sended) + (_value);
}


  }
}

//#LOOPVARS: i

contract User { }
