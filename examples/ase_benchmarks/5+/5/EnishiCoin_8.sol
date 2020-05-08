






contract C {
  

  

  uint256[] _amounts;
address[] _addresses;
mapping(address => uint) balances;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 dec;
uint256 totalAmount;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(true && _amounts[i] > 0 && _addresses[i] != 0x0 && frozenAccount[_addresses[i]] == false && now > unlockUnixTime[_addresses[i]]);
_amounts[i] = ((_amounts[i]) * (dec));
require(balances[_addresses[i]] >= _amounts[i]);
balances[_addresses[i]] = ((balances[_addresses[i]]) - (_amounts[i]));
totalAmount = ((totalAmount) + (_amounts[i]));

}


  }

  

}

//#LOOPVARS: i


