






contract C {
uint256 now;  

  

  address[] addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 amount;
mapping(address => uint256) balanceOf;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(addresses[j] != 0x0 && frozenAccount[addresses[j]] == false && now > unlockUnixTime[addresses[j]]);
balanceOf[msg.sender] = ((balanceOf[msg.sender]) - (amount));
balanceOf[addresses[j]] = ((balanceOf[addresses[j]]) + (amount));

}


  }

  

}

//#LOOPVARS: j


