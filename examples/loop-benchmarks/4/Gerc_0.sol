
pragma solidity ^0.5.10;



contract C {
  

  address owner;
uint256 _size;
uint256 airdropValue;
mapping(address => uint256) balances;
address[] payees;
uint256 amount;
uint i;

  function foo() public {
    
for(uint i = 0; i < _size; i++){
if (payees[i] == address(0)) {
amount = (amount) - (airdropValue);
continue;
}

balances[payees[i]] = (balances[payees[i]]) + (airdropValue);
emit Transfer(owner, payees[i], airdropValue);
}


  }
}

//#LOOPVARS: i
