
pragma solidity ^0.5.10;



contract C {
  

  address _tokenAddress;
address owner;
mapping(address => uint256) balances;
address[] addresses;
uint256 _ebytebal;
uint256 _value;
uint256 _ethbal;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
if (getEthBalance(addresses[i]) < _ethbal) {
continue;
}

if (getTokenBalance(_tokenAddress, addresses[i]) < _ebytebal) {
continue;
}

balances[owner] = (balances[owner]) - (_value);
balances[addresses[i]] = (balances[addresses[i]]) + (_value);
Transfer(owner, addresses[i], _value);
}


  }
}

//#LOOPVARS: i
