






contract C {
  

  

  address[] addresses;
mapping(address => uint) balances;
uint256[] amounts;
uint i;
uint[] empty;

  function foo() public {
    
for(i = 0; i < addresses.length; i++){
balances[addresses[i]] = ((balances[addresses[i]]) + (amounts[i]));

}


  }

  

}

//#LOOPVARS: i


