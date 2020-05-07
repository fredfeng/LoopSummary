






contract C {
uint256 now;  

  

  address[] addresses;
uint[] amounts;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 totalAmount;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0 && addresses[j] != 0x0 && frozenAccount[addresses[j]] == false && now > unlockUnixTime[addresses[j]]);
amounts[j] = ((amounts[j]) * (1e16));
totalAmount = ((totalAmount) + (amounts[j]));
}


  }

  

}

//#LOOPVARS: j


