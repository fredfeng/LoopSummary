






contract C {
  

  

  address[] _addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 _amount;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_addresses[j] != 0x0 && frozenAccount[_addresses[j]] == false && now > unlockUnixTime[_addresses[j]]);
balances[msg.sender] = ((balances[msg.sender]) - (_amount));
balances[_addresses[j]] = ((balances[_addresses[j]]) + (_amount));

}


  }

  

}

//#LOOPVARS: j


