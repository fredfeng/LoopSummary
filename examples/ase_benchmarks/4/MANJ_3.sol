






contract C {
  

  

  address[] addresses;
uint[] amounts;
bool cannotReceive;
uint256 cannotReceiveUntil;
mapping(address => uint256) balanceOf;
uint256 totalAmount;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(amounts[i] > 0 && addresses[i] != address(0) && cannotReceive[addresses[i]] == false && now > cannotReceiveUntil[addresses[i]]);
amounts[i] = ((amounts[i]) * (1e8));
balanceOf[addresses[i]] = ((balanceOf[addresses[i]]) + (amounts[i]));
totalAmount = ((totalAmount) + (amounts[i]));

}


  }

  

}

//#LOOPVARS: i


