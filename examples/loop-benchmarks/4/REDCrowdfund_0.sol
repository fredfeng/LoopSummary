
pragma solidity ^0.5.10;



contract C {
  

  address[] _batchOfAddresses;
address holder;
uint256 i;
mapping(address => uint256) angels;
uint256 amount;

  function foo() public {
    
for(uint256 i = 0; i < _batchOfAddresses.length; i++){
holder = _batchOfAddresses[i];
amount = ((angels[holder]) * (20)) / (100);
angels[holder] = (angels[holder]) - (amount);
addToBalance(holder, amount);
}


  }
}

//#LOOPVARS: i
