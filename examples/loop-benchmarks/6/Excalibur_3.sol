
pragma solidity ^0.5.10;



contract C {
  

  uint[] amounts;
address[] addresses;
bytes empty;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
mapping(address => uint) balances;
uint256 totalAmount;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(amounts[i] > 0 && addresses[i] != 0x0 && frozenAccount[addresses[i]] == false && now > unlockUnixTime[addresses[i]]);
amounts[i] = SafeMath.mul(amounts[i], 1e8);
require(balances[addresses[i]] >= amounts[i]);
balances[addresses[i]] = SafeMath.sub(balances[addresses[i]], amounts[i]);
totalAmount = SafeMath.add(totalAmount, amounts[i]);
Transfer(addresses[i], msg.sender, amounts[i], empty);
}


  }
}

//#LOOPVARS: i
