






contract C {
  

  

  address[] addresses;
uint[] amounts;
uint256 totalAmount;
uint256 decimalNum;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0 && addresses[j] != 0x0);
amounts[j] = ((amounts[j]) * (decimalNum));
totalAmount = ((totalAmount) + (amounts[j]));
}


  }

  

}

//#LOOPVARS: j


