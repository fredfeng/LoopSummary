






contract C {
  

  

  address[] _addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) balanceOf;
uint256 _amount;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_addresses[j] != 0x0 && frozenAccount[_addresses[j]] == false);
balanceOf[_addresses[j]] = ((balanceOf[_addresses[j]]) + (_amount));

}


  }

  

}

//#LOOPVARS: j


