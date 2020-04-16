
pragma solidity ^0.5.10;



contract C {
  

  uint256 index;
address _who;
mapping(address => LockedBalance[]) lockedBalances;
uint256 locked;
uint256 time;

  function foo() public {
    
while(index < lockedBalances[_who].length){
if (lockedBalances[_who][index].expires > time) {
locked = (locked) + (lockedBalances[_who][index].value);
}

index++;
}

  }
}

//#LOOPVARS: 

contract LockedBalance { }
