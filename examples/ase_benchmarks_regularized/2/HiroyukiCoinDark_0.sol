






contract C {
  

  

  address[] addresses;
uint256 amount;
mapping(address => uint256) balanceOf;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(addresses[j] != 0x0);

balanceOf[addresses[j]] = ((balanceOf[addresses[j]]) + (amount));
}


  }

  

}

//#LOOPVARS: j


