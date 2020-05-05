






contract C {
  

  

  address[] users;
mapping(address => uint256) whitelist;
uint256[] amount;
uint len;

  function foo() public {
    
for(uint i = 0; i < len; i++){
address user = users[i];
uint256 newAmount = amount[i] * (10 ** 18);
whitelist[user] = newAmount;
}


  }

  

}

//#LOOPVARS: i


