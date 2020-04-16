
pragma solidity ^0.5.10;



contract C {
  

  uint[] _amounts;
address[] _addresses;
uint i;
mapping(address => bool) locked;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
if (locked[_addresses[i]] == false) super.transfer(_addresses[i], _amounts[i]);

}


  }
}

//#LOOPVARS: i
