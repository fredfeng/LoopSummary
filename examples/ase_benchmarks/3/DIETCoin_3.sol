






contract C {
  

  

  address[] addresses;
uint[] amounts;
mapping(address => bool) frozenAccount;
uint256 totalAmount;
mapping(address => uint256) unlockUnixTime;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0 && addresses[j] != 0x0 && frozenAccount[addresses[j]] == false && now > unlockUnixTime[addresses[j]]);
amounts[j] = ((amounts[j]) * (1e8));
totalAmount = ((totalAmount) + (amounts[j]));
}


  }

  

}

//#LOOPVARS: j


