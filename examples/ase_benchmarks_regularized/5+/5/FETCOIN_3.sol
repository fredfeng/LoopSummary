






contract C {
  

  

  address[] _addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) balanceOf;
uint256 totalAmount;
uint[] _amounts;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_amounts[j] > 0 && _addresses[j] != 0x0 && frozenAccount[_addresses[j]] == false);
_amounts[j] = ((_amounts[j]) * (1e6));
require(balanceOf[_addresses[j]] >= _amounts[j]);
balanceOf[_addresses[j]] = ((balanceOf[_addresses[j]]) - (_amounts[j]));
totalAmount = ((totalAmount) + (_amounts[j]));

}


  }

  

}

//#LOOPVARS: j


