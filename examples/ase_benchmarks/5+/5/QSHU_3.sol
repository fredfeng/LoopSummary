






contract C {
  

  

  address[] addresses;
uint[] amounts;
mapping(address => uint) balances;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 totalAmount;

  function foo() public {
    
for(uint q = 0; q < addresses.length; q++){
require(amounts[q] > 0 && addresses[q] != 0x0 && frozenAccount[addresses[q]] == false && now > unlockUnixTime[addresses[q]]);
amounts[q] = ((amounts[q]) * (1e8));
require(balances[addresses[q]] >= amounts[q]);
balances[addresses[q]] = ((balances[addresses[q]]) - (amounts[q]));
totalAmount = ((totalAmount) + (amounts[q]));

}


  }

  

}

//#LOOPVARS: q


