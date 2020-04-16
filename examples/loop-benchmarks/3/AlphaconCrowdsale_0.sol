
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
Holder[] holders;
address[] _addrs;
uint256 accRatio;
uint96[] _ratios;

  function foo() public {
    
for(uint8 i = 0; i < _addrs.length; i++){
if (_addrs[i] != address(0)) {
holders.push(Holder(_addrs[i], _ratios[i]));
}

accRatio = (accRatio) + (uint256(_ratios[i]));
}


  }
}

//#LOOPVARS: i

contract uint96 { }

contract Holder { }
