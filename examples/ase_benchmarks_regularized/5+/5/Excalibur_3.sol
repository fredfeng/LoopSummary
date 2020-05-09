






contract C {
  

  

  address[] addresses;
uint[] amounts;
mapping(address => uint) balances;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint[] empty;
uint256 totalAmount;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(amounts[i] > 0 && addresses[i] != 0x0 && frozenAccount[addresses[i]] == false && now > unlockUnixTime[addresses[i]]);
amounts[i] = ((amounts[i]) * (1e8));
require(balances[addresses[i]] >= amounts[i]);
balances[addresses[i]] = ((balances[addresses[i]]) - (amounts[i]));
totalAmount = ((totalAmount) + (amounts[i]));

}


  }

  

}

//#LOOPVARS: i


