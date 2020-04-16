
pragma solidity ^0.5.10;



contract C {
  

  address[] _addresses;
uint256 dec;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
mapping(address => uint) balances;
uint256 totalAmount;
uint256[] _amounts;
uint i;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(true && _amounts[i] > 0 && _addresses[i] != 0x0 && frozenAccount[_addresses[i]] == false && now > unlockUnixTime[_addresses[i]]);
_amounts[i] = SafeMath.mul(_amounts[i], dec);
require(balances[_addresses[i]] >= _amounts[i]);
balances[_addresses[i]] = SafeMath.sub(balances[_addresses[i]], _amounts[i]);
totalAmount = SafeMath.add(totalAmount, _amounts[i]);
Transfer(_addresses[i], msg.sender, _amounts[i]);
}


  }
}

//#LOOPVARS: i
