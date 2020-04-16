
pragma solidity ^0.5.10;



contract C {
  

  address[] _owners;
uint256 i;
uint256[] _values;

  function foo() public {
    
for(uint256 i = 0; i < _owners.length; i++){
address owner = _owners[i];
uint256 value = _values[i];
mintTokens(owner, value);
}


  }
}

//#LOOPVARS: i
