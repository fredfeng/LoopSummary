
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256[] _amounts;
address[] _addrs;

  function foo() public {
    
for(uint8 i = 0; i < _addrs.length; i++){
airDeliver(_addrs[i], _amounts[i]);
}


  }
}

//#LOOPVARS: i
