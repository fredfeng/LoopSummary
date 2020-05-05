






contract C {
  

  

  address[] addresses;
mapping(address => uint) balances;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 amount;

  function foo() public {
    
for(uint q = 0; q < addresses.length; q++){
require(addresses[q] != 0x0 && frozenAccount[addresses[q]] == false && now > unlockUnixTime[addresses[q]]);
balances[addresses[q]] = ((balances[addresses[q]]) + (amount));

}


  }

  

}

//#LOOPVARS: q


