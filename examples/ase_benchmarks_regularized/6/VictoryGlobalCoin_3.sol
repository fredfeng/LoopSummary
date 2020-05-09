






contract C {
  

  

  address[] addresses;
mapping(address => uint) balances;
mapping(address => bool) frozenAccount;
uint256[] amounts;
uint[] empty;
uint256 totalAmount;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0);
require(addresses[j] != address(0));
require(!frozenAccount[addresses[j]]);
require(balances[addresses[j]] >= amounts[j]);
balances[addresses[j]] = ((balances[addresses[j]]) - (amounts[j]));
totalAmount = ((totalAmount) + (amounts[j]));

}


  }

  

}

//#LOOPVARS: j


