
pragma solidity ^0.5.10;



contract C {
  

  address _from;
mapping(address => uint256) balances;
address[] _addrs;
uint256 total;
uint256[] _values;
uint i;

  function foo() public {
    
for(uint i = 0; i < _addrs.length; ++i){
address addr = _addrs[i];
require(addr != 0x0);
uint256 value = _values[i];
balances[addr] = (balances[addr]) + (value);
total = (total) + (value);
Transfer(_from, addr, value);
}


  }
}

//#LOOPVARS: i
