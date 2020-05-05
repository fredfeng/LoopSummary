






contract C {
  

  

  address[] addresses;
uint[] amounts;
mapping(address => uint256) balanceOf;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
balanceOf[addresses[i]] = ((balanceOf[addresses[i]]) + (amounts[i]));

}


  }

  

}

//#LOOPVARS: i


