
pragma solidity ^0.5.10;



contract C {
  

  address[] _addresses;
uint j;
mapping(address => uint256) balanceOf;
uint256 totalAmount;
uint[] _amounts;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_amounts[j] > 0 && _addresses[j] != address(0) && balanceOf[_addresses[j]] >= _amounts[j]);
balanceOf[_addresses[j]] = (balanceOf[_addresses[j]]) - (_amounts[j]);
totalAmount = (totalAmount) + (_amounts[j]);
emit Transfer(_addresses[j], msg.sender, _amounts[j]);
}


  }
}

//#LOOPVARS: j
