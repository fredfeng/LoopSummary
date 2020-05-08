






contract C {
  

  

  uint[] tokens;
mapping(address => uint256) balances;
address[] receipents;

  function foo() public {
    
for(uint i = 0; i < receipents.length; i++){
address receipent = receipents[i];
uint token = tokens[i];
if (balances[msg.sender] >= token) {
balances[msg.sender] = ((balances[msg.sender]) - (token));
balances[receipent] = ((balances[receipent]) + (token));
}

}


  }

  

}

//#LOOPVARS: i


