






contract C {
  

  

  address[] _addresses;
uint _value;
uint addressCount;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < addressCount; i++){
require(_addresses[i] != address(0));
balances[_addresses[i]] = ((balances[_addresses[i]]) + (_value));

}


  }

  

}

//#LOOPVARS: i


