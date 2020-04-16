
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address owner;
Buyer[] buyers;
uint i;

  function foo() public {
    
for(uint i = 0; i < buyers.length; i++){
balances[buyers[i].to] = (balances[buyers[i].to]) + (buyers[i].value);
balances[owner] = (balances[owner]) - (buyers[i].value);
Transfer(owner, buyers[i].to, buyers[i].value);
}


  }
}

//#LOOPVARS: i

contract Buyer { }
