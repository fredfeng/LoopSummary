
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
address[] _from;
bytes32[] _r;
uint8[] _v;
uint256[] _values;
uint256[] _nonces;
bytes32[] _s;
uint256[] _fees;
uint i;

  function foo() public {
    
for(uint i; i < _from.length; i++){
transferPreSigned(_from[i], _to[i], _values[i], _fees[i], _nonces[i], _v[i], _r[i], _s[i]);
}


  }
}

//#LOOPVARS: i
