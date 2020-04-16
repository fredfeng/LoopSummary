
pragma solidity ^0.5.10;



contract C {
  

  TokenInterface token;
uint i;
uint256 _value;
address[] _addrs;

  function foo() public {
    
for(uint i = 0; i < _addrs.length; i++){
if (_addrs[i] != address(0)) {
token.transfer(_addrs[i], _value * (10 ** 18));
}

}


  }
}

//#LOOPVARS: i

contract TokenInterface { }
