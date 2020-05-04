






contract C {
  

  

  address[] addresses;
uint j;
uint256[] amounts;
mapping(address => uint256) balanceOf;

  function foo() public {
    
for(j = 0; j < addresses.length; j++){
balanceOf[msg.sender] = ((balanceOf[msg.sender]) - (amounts[j]));
balanceOf[addresses[j]] = ((balanceOf[addresses[j]]) + (amounts[j]));

}


  }

  

}

//#LOOPVARS: j


