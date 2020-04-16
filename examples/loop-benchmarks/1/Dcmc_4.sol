
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256[]) lockupBalances;
uint256 balance;
uint i;
address _owner;

  function foo() public {
    
for(uint i = 0; i < 7; i++){
balance = (balance) + (lockupBalances[_owner][i]);
}


  }
}

//#LOOPVARS: i
