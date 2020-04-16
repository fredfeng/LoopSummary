
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) isOwner;
address[] _owners;
uint i;

  function foo() public {
    
for(uint i = 0; i < _owners.length; i++){
require(!(isOwner[_owners[i]] || _owners[i] == 0));
isOwner[_owners[i]] = true;
}


  }
}

//#LOOPVARS: i
