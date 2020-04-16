
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) whitelist;
uint len;
uint256[] amount;
address[] users;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i++){
address user = users[i];
uint256 newAmount = amount[i] * (10 ** 18);
whitelist[user] = newAmount;
}


  }
}

//#LOOPVARS: i
