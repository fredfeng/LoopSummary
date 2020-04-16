
pragma solidity ^0.5.10;



contract C {
  

  uint[] times;
address _address;
bool find;
uint j;
mapping(address => TimeLock[]) allocations;
uint256[] balanceRequires;
uint i;

  function foo() public {
    
for(uint j = 0; j < allocations[_address].length; j++){
if (allocations[_address][j].releaseTime == times[i]) {
allocations[_address][j].balance = (allocations[_address][j].balance) + (balanceRequires[i]);
find = true;
break;
}

}


  }
}

//#LOOPVARS: j

contract TimeLock { }
