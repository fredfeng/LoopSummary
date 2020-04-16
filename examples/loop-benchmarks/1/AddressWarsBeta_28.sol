
pragma solidity ^0.5.10;



contract C {
  

  address[] ownersOfCardAddress;
mapping(address => uint256) _indexOf;
uint256 i;
bytes4[] allOwners;

  function foo() public {
    
for(uint256 i = 0; i < ownersOfCardAddress.length; i++){
allOwners[i] = bytes4(_indexOf[ownersOfCardAddress[i]]);
}


  }
}

//#LOOPVARS: i

contract bytes4 { }
