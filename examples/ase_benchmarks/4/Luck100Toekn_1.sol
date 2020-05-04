






contract C {
  

  

  address[] _tos;
uint256 all;
uint256[] _values;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _tos.length; i++){
require(_tos[i] != address(0));
require(_tos[i] != msg.sender);
all = ((all) + (_values[i]));
balances[_tos[i]] = ((balances[_tos[i]]) + (_values[i]));

}


  }

  

}

//#LOOPVARS: i


