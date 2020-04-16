
pragma solidity ^0.5.10;



contract C {
  

  uint256 ownerCount;
address owner;
address[] owners;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < owners.length; i++){
if (owner == owners[i]) {
ownerCount++;
}

}


  }
}

//#LOOPVARS: i
