






contract C {
  

  

  address[] _tos;
uint256 _value;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _tos.length; i++){
require(_tos[i] != address(0));
require(_tos[i] != msg.sender);
balances[_tos[i]] = ((balances[_tos[i]]) + (_value));

}


  }

  

}

//#LOOPVARS: i


