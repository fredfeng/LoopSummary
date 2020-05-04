






contract C {
  

  

  address[] addresses;
bool cannotReceive;
uint256 amount;
mapping(address => uint256) balanceOf;
uint256 cannotReceiveUntil;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(addresses[i] != address(0) && cannotReceive[addresses[i]] == false && now > cannotReceiveUntil[addresses[i]]);
balanceOf[addresses[i]] = ((balanceOf[addresses[i]]) + (amount));

}


  }

  

}

//#LOOPVARS: i


