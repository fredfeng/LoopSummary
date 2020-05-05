






contract C {
  

  

  address[] _addresses;
mapping(address => uint256) balanceOf;
uint256 _amount;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_addresses[j] != address(0));
balanceOf[_addresses[j]] = ((balanceOf[_addresses[j]]) + (_amount));

}


  }

  

}

//#LOOPVARS: j


