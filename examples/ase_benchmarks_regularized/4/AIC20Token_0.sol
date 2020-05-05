






contract C {
  

  

  uint len;
uint tokens;
address[] toAddresses;
mapping(address => uint) balances;

  function foo() public {
    
for(uint i = 0; i < len; i++){
address _to = toAddresses[i];
require(address(0) != _to);
balances[_to] = ((balances[_to]) + (tokens));
balances[msg.sender] = ((balances[msg.sender]) - (tokens));

}


  }

  

}

//#LOOPVARS: i


