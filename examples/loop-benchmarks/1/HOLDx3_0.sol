
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint[]) invest_amount;
mapping(address => uint) invest_count;
uint16 i;

  function foo() public {
    
for(uint16 i = 0; i < invest_count[msg.sender]; i++){
invest_amount[msg.sender][i] = 0;
}


  }
}

//#LOOPVARS: i
