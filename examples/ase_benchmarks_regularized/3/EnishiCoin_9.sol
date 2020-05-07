






contract C {
uint256 now;  

  

  address[] _addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
mapping(address => uint256) temporaryLimitUnixTime;
mapping(address => uint) temporaryBalances;
uint256 _amount;
uint _limitUnixTime;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(true && _addresses[i] != 0x0 && frozenAccount[_addresses[i]] == false && now > unlockUnixTime[_addresses[i]]);
temporaryBalances[_addresses[i]] = ((temporaryBalances[_addresses[i]]) + (_amount));
temporaryLimitUnixTime[_addresses[i]] = _limitUnixTime;
}


  }

  

}

//#LOOPVARS: i


