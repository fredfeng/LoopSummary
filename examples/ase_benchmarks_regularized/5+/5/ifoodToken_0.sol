






contract C {
  

  

  uint256[] _amounts;
address[] _addresses;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 i = 0; i < _addresses.length; i++){
require(_addresses[i] != address(0));
require(_amounts[i] <= balances[msg.sender]);
require(_amounts[i] > 0);
balances[msg.sender] = ((balances[msg.sender]) - (_amounts[i]));
balances[_addresses[i]] = ((balances[_addresses[i]]) + (_amounts[i]));

}


  }

  

}

//#LOOPVARS: i


