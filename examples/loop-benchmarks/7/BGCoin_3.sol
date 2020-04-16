
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
bytes empty;
mapping(address => bool) frozenAccount;
uint j;
uint256[] amounts;
mapping(address => uint) balances;
uint256 totalAmount;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0);
require(addresses[j] != address(0));
require(!frozenAccount[addresses[j]]);
require(balances[addresses[j]] >= amounts[j]);
balances[addresses[j]] = (balances[addresses[j]]) - (amounts[j]);
totalAmount = (totalAmount) + (amounts[j]);
emit Transfer(addresses[j], msg.sender, amounts[j], empty);
}


  }
}

//#LOOPVARS: j
