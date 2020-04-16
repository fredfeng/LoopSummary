
pragma solidity ^0.5.10;



contract C {
  

  uint len;
address[] toAddresses;
uint tokens;
mapping(address => uint) balances;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i++){
address _to = toAddresses[i];
require(address(0) != _to);
balances[_to] = (balances[_to]) + (tokens);
balances[msg.sender] = (balances[msg.sender]) - (tokens);
emit Transfer(msg.sender, _to, tokens);
}


  }
}

//#LOOPVARS: i
