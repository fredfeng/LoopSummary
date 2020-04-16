
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
address[] _owners;
uint i;
mapping(address => uint) balances;

  function foo() public {
    
for(uint i = 0; i < _owners.length; i++){
balances[_owners[i]] = (totalSupply) / (_owners.length);
}


  }
}

//#LOOPVARS: i
