
pragma solidity ^0.5.10;



contract C {
  

  uint toReturn;
uint[] _amounts;
address[] _addresses;
uint i;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
_safeTransfer(_addresses[i], _amounts[i]);
toReturn = SafeMath.sub(toReturn, _amounts[i]);
emit MultiTransfer(msg.sender, msg.value, _addresses[i], _amounts[i]);
}


  }
}

//#LOOPVARS: i
