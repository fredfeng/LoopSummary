






contract C {
  

  

  address[] addresses;
mapping(address => uint) balances;
mapping(address => bool) frozenAccount;
uint256 amount;
uint[] empty;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(addresses[i] != address(0));
require(!frozenAccount[addresses[i]]);
balances[addresses[i]] = ((balances[addresses[i]]) + (amount));

}


  }

  

}

//#LOOPVARS: i


