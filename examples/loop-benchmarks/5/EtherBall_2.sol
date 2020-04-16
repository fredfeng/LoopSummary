
pragma solidity ^0.5.10;



contract C {
  

  address _tokenAddress;
address owner;
mapping(address => uint256) balances;
address[] addresses;
uint256 _ebytebal;
uint256 _perc;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
if (getTokenBalance(_tokenAddress, addresses[i]) < _ebytebal) {
continue;
}

uint256 toGive = (getTokenBalance(_tokenAddress,(( addresses[i])) / (100))) * (_perc);
balances[owner] = (balances[owner]) - (toGive);
balances[addresses[i]] = (balances[addresses[i]]) + (toGive);
Transfer(owner, addresses[i], toGive);
}


  }
}

//#LOOPVARS: i
