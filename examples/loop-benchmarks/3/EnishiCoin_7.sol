
pragma solidity ^0.5.10;



contract C {
  

  address[] _addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 _amount;
mapping(address => uint) balances;
uint i;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(true && _addresses[i] != 0x0 && frozenAccount[_addresses[i]] == false && now > unlockUnixTime[_addresses[i]]);
balances[_addresses[i]] = SafeMath.add(balances[_addresses[i]], _amount);
Transfer(msg.sender, _addresses[i], _amount);
}


  }
}

//#LOOPVARS: i
