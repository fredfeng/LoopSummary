
pragma solidity ^0.5.10;



contract C {
  

  uint[] amounts;
address[] addresses;
uint q;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
mapping(address => uint) balances;
uint256 totalAmount;

  function foo() public {
    
for(uint q = 0; q < addresses.length; q++){
require(amounts[q] > 0 && addresses[q] != 0x0 && frozenAccount[addresses[q]] == false && now > unlockUnixTime[addresses[q]]);
amounts[q] = SafeMath.mul(amounts[q], 1e8);
require(balances[addresses[q]] >= amounts[q]);
balances[addresses[q]] = SafeMath.sub(balances[addresses[q]], amounts[q]);
totalAmount = SafeMath.add(totalAmount, amounts[q]);
emit Transfer(addresses[q], msg.sender, amounts[q]);
}


  }
}

//#LOOPVARS: q
