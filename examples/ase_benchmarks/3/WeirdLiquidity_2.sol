






contract C {
  

  

  address[] addresses;
uint[] amounts;
mapping(address => uint256) unlockUnixTime;
uint256 totalAmount;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0 && addresses[j] != 0x0 && now > unlockUnixTime[addresses[j]]);
amounts[j] = ((amounts[j]) * (1e8));
totalAmount = ((totalAmount) + (amounts[j]));
}


  }

  

}

//#LOOPVARS: j


