
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
mapping(address => uint256) balances;
address[] receivers;
uint256 amount;
uint i;

  function foo() public {
    
for(uint i = 0; i < receivers.length; i++){
totalSupply = (totalSupply) + (amount);
balances[receivers[i]] = (balances[receivers[i]]) + (amount);
Transfer(address(this), receivers[i], amount);
}


  }
}

//#LOOPVARS: i
