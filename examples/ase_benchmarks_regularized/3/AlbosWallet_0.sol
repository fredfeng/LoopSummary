






contract C {
  

  

  address[] sender;
uint256[] amount;
mapping(address => uint256) balances;
mapping(address => uint256) uniqueTokens;

  function foo() public {
    
for(uint i = 0; i < sender.length; i++){
uniqueTokens[sender[i]] = ((uniqueTokens[sender[i]]) + (amount[i]));
balances[address(this)] = ((balances[address(this)]) - (amount[i]));
balances[sender[i]] = ((balances[sender[i]]) + (amount[i]));

}


  }

  

}

//#LOOPVARS: i


