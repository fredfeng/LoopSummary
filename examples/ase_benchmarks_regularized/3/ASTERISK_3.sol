






contract C {
  

  

  address[] _addresses;
mapping(address => uint256) balanceOf;
uint256 totalAmount;
uint[] _amounts;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_amounts[j] > 0 && _addresses[j] != address(0) && balanceOf[_addresses[j]] >= _amounts[j]);
balanceOf[_addresses[j]] = ((balanceOf[_addresses[j]]) - (_amounts[j]));
totalAmount = ((totalAmount) + (_amounts[j]));

}


  }

  

}

//#LOOPVARS: j


