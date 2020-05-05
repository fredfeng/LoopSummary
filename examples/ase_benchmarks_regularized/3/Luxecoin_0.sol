






contract C {
  

  

  uint256[] values;
mapping(address => uint256) balances;
address[] recipients;

  function foo() public {
    
for(uint256 i = 0; i < recipients.length; i++){
require(balances[msg.sender] >= values[i]);
balances[msg.sender] = ((balances[msg.sender]) - (values[i]));
balances[recipients[i]] = ((balances[recipients[i]]) + (values[i]));

}


  }

  

}

//#LOOPVARS: i


