






contract C {
  

  

  address[] addresses;
uint256[] amounts;
uint i;
uint[] empty;
mapping(address => uint256) balances;

  function foo() public {
    
for(i = 0; i < addresses.length; i++){
balances[addresses[i]] = ((balances[addresses[i]]) + (amounts[i]));

}


  }

  

}

//#LOOPVARS: i


