
pragma solidity ^0.5.10;



contract C {
  

  uint[] _values;
mapping(address => uint256) balances;
address[] _recipients;
mapping(address => transferInStruct[]) transferIns;
uint j;
uint64 _now;

  function foo() public {
    
for(uint j = 0; j < _recipients.length; j++){
balances[_recipients[j]] = (balances[_recipients[j]]) + (_values[j]);
transferIns[_recipients[j]].push(transferInStruct(uint128(_values[j]), _now));
Transfer(msg.sender, _recipients[j], _values[j]);
}


  }
}

//#LOOPVARS: j

contract transferInStruct { }
