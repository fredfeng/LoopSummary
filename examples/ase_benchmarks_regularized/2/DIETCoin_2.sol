






contract C {
  

  

  address[] addresses;
uint256 amount;
mapping(address => bool) frozenAccount;
mapping(address => uint256) balanceOf;
mapping(address => uint256) unlockUnixTime;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(addresses[j] != 0x0 && frozenAccount[addresses[j]] == false && now > unlockUnixTime[addresses[j]]);
balanceOf[addresses[j]] = ((balanceOf[addresses[j]]) + (amount));

}


  }

  

}

//#LOOPVARS: j

