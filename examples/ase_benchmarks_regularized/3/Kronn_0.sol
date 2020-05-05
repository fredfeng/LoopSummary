






contract C {
  

  

  address[] addresses;
mapping(address => bool) frozenAccount;
uint256 amount;
uint[] empty;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(addresses[i] != address(0));
require(!frozenAccount[addresses[i]]);
balances[addresses[i]] = ((balances[addresses[i]]) + (amount));

}


  }

  

}

//#LOOPVARS: i


