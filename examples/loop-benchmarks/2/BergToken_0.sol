
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address[] _address;
uint256 totalSupply_;
uint256[] _amount;
uint i;

  function foo() public {
    
for(uint i = 0; i < _address.length; i++){
balances[_address[i]] = (balances[_address[i]]) - (_amount[i]);
totalSupply_ = (totalSupply_) - (_amount[i]);
}


  }
}

//#LOOPVARS: i
