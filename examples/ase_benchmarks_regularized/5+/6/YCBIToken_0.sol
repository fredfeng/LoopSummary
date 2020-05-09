






contract C {
  

  

  uint256 total;
uint256[] _values;
mapping(address => uint256) balances;
address _from;
address[] _addrs;

  function foo() public {
    
for(uint i = 0; i < _addrs.length; ++i){
address addr = _addrs[i];
require(addr != 0x0);
require(_values[i] > 0);
uint256 value = _values[i];
balances[addr] = ((balances[addr]) + (value));
total = ((total) + (value));

}


  }

  

}

//#LOOPVARS: i


