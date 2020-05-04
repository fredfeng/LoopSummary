






contract C {
  

  

  uint256[] _amounts;
address[] _addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 totalAmount;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_amounts[j] > 0 && _addresses[j] != 0x0 && frozenAccount[_addresses[j]] == false && now > unlockUnixTime[_addresses[j]]);
totalAmount = ((totalAmount) + (_amounts[j]));
}


  }

  

}

//#LOOPVARS: j


