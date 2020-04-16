
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
uint256[] _amounts;
uint i;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _recipients.length; i++){
balances[_recipients[i]] = (balances[_recipients[i]]) + (_amounts[i]);
emit Transfer(address(0), _recipients[i], _amounts[i]);
}


  }
}

//#LOOPVARS: i
