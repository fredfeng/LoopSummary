






contract C {
  

  

  address[] addresses;
uint[] amounts;
mapping(address => uint256) balanceOf;
uint256 totalAmount;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0 && addresses[j] != 0x0);
amounts[j] = ((amounts[j]) * (1e8));
require(balanceOf[addresses[j]] >= amounts[j]);
balanceOf[addresses[j]] = ((balanceOf[addresses[j]]) - (amounts[j]));
totalAmount = ((totalAmount) + (amounts[j]));

}


  }

  

}

//#LOOPVARS: j


