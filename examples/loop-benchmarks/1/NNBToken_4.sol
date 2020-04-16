
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => TimeLock[]) allocations;
address owner;
uint i;

  function foo() public {
    
for(uint i = 0; i < allocations[owner].length; i++){
if (allocations[owner][i].time >= now) {
return allocations[owner][i].balance;
}

}


  }
}

//#LOOPVARS: i

contract TimeLock { }
