






contract C {
  

  

  address[] addresses;
mapping(address => uint) balances;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 amount;
uint[] empty;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(addresses[i] != 0x0 && frozenAccount[addresses[i]] == false && now > unlockUnixTime[addresses[i]]);
balances[addresses[i]] = ((balances[addresses[i]]) + (amount));

}


  }

  

}

//#LOOPVARS: i


