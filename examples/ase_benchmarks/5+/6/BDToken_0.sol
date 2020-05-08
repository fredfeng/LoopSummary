






contract C {
  

  

  address[] _addresses;
mapping(address => uint) balances;
uint[] _amounts;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(_addresses[i] != address(0));
require(_amounts[i] > 0);
require(balances[msg.sender] >= _amounts[i]);
require(balances[_addresses[i]] + _amounts[i] >= balances[_addresses[i]]);
balances[msg.sender] = ((balances[msg.sender]) - (_amounts[i]));
balances[_addresses[i]] = ((balances[_addresses[i]]) + (_amounts[i]));

}


  }

  

}

//#LOOPVARS: i


