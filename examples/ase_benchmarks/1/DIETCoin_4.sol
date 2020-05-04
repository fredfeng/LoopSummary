






contract C {
  

  

  uint j;
address[] addresses;
uint[] amounts;
mapping(address => uint256) balanceOf;

  function foo() public {
    
for(j = 0; j < addresses.length; j++){
balanceOf[addresses[j]] = ((balanceOf[addresses[j]]) + (amounts[j]));

}


  }

  

}

//#LOOPVARS: j


