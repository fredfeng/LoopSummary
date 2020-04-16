
pragma solidity ^0.5.10;



contract C {
  

  ShizzleNizzle SHNZ;
uint i;
uint256 _amount;
address[] _addrs;

  function foo() public {
    
for(uint i = 0; i < _addrs.length; i++){
if (_addrs[i] != 0x0) {
SHNZ.transfer(_addrs[i], (_amount) * (100000000));
}

}


  }
}

//#LOOPVARS: i

contract ShizzleNizzle { }
