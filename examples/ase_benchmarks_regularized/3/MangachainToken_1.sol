






contract C {
uint256 now;  

  

  address[] addresses;
uint[] amounts;
mapping(address => uint256) unlockUnixTime;
uint256 totalAmount;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(amounts[i] > 0 && addresses[i] != 0x0 && now > unlockUnixTime[addresses[i]]);
amounts[i] = ((amounts[i]) * (1e8));
totalAmount = ((totalAmount) + (amounts[i]));
}


  }

  

}

//#LOOPVARS: i


