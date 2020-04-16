
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
uint256[] _values;
uint256 j;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 j = 0; j < _recipients.length; j++){
balances[_recipients[j]] = (balances[_recipients[j]]) + (_values[j]);
Transfer(msg.sender, _recipients[j], _values[j]);
}


  }
}

//#LOOPVARS: j
