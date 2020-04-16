
pragma solidity ^0.5.10;



contract C {
  

  uint _limitUnixTime;
address[] _addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 _amount;
mapping(address => uint) temporaryBalances;
mapping(address => uint256) temporaryLimitUnixTime;
uint i;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(true && _addresses[i] != 0x0 && frozenAccount[_addresses[i]] == false && now > unlockUnixTime[_addresses[i]]);
temporaryBalances[_addresses[i]] = SafeMath.add(temporaryBalances[_addresses[i]], _amount);
temporaryLimitUnixTime[_addresses[i]] = _limitUnixTime;
}


  }
}

//#LOOPVARS: i
