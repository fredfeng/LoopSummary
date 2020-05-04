






contract C {
  

  

  address[] addresses;
uint[] amounts;
mapping(address => uint) balances;
uint i;

  function foo() public {
    
for(i = 0; i < addresses.length; i++){
balances[addresses[i]] = ((balances[addresses[i]]) + (amounts[i]));

}


  }

  

}

//#LOOPVARS: i


