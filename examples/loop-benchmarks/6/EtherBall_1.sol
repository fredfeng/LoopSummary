
pragma solidity ^0.5.10;



contract C {
  

  uint256 _div;
address owner;
mapping(address => uint256) balances;
address[] addresses;
uint i;
uint256 _ethbal;
uint256 _value;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
if (getEthBalance(addresses[i]) < _ethbal) {
continue;
}

uint256 ethMulti = (getEthBalance(addresses[i])) / (1000000000);
uint256 toDistr = (((_value) * (ethMulti))) / (_div);
balances[owner] = (balances[owner]) - (toDistr);
balances[addresses[i]] = (balances[addresses[i]]) + (toDistr);
Transfer(owner, addresses[i], toDistr);
}


  }
}

//#LOOPVARS: i
