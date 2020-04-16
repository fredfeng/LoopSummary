
pragma solidity ^0.5.10;



contract C {
  

  address target;
mapping(address => TimeLock[]) allocations;
uint i;
uint256 value;

  function foo() public {
    
for(uint i = 0; i < allocations[target].length; i++){
if (now >= allocations[target][i].time) {
value = (value) + (allocations[target][i].balance);
allocations[target][i].balance = 0;
}

}


  }
}

//#LOOPVARS: i

contract TimeLock { }
