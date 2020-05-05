






contract C {
  

  

  uint256 amount;
uint256 totalSupply;
address[] receivers;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < receivers.length; i++){
totalSupply = ((totalSupply) + (amount));
balances[receivers[i]] = ((balances[receivers[i]]) + (amount));

}


  }

  

}

//#LOOPVARS: i


