
pragma solidity ^0.5.10;



contract C {
  

  uint[] times;
address _address;
mapping(address => TimeLock[]) allocations;
uint256[] balanceRequires;
uint i;

  function foo() public {
    
for(uint i = 0; i < times.length; i++){
bool find = false;
for (uint j = 0; j < allocations[_address].length; j++) {
if (allocations[_address][j].releaseTime == times[i]) {
allocations[_address][j].balance = allocations[_address][j].balance.add(balanceRequires[i]);
find = true;
break;
}

}

if (!find) {
allocations[_address].push(TimeLock(times[i], balanceRequires[i]));
}

}


  }
}

//#LOOPVARS: i

contract TimeLock { }
