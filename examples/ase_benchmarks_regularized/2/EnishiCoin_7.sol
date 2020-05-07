






contract C {
uint256 now;  

  

  address[] _addresses;
mapping(address => uint) balances;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 _amount;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(true && _addresses[i] != 0x0 && frozenAccount[_addresses[i]] == false && now > unlockUnixTime[_addresses[i]]);
balances[_addresses[i]] = ((balances[_addresses[i]]) + (_amount));

}


  }

  

}

//#LOOPVARS: i


