
pragma solidity ^0.5.10;



contract C {
  

  bool exist;
uint256 index;
address _who;
mapping(address => LockedBalance[]) lockedBalances;
uint256 _expires;

  function foo() public {
    
while(index < lockedBalances[_who].length){
if (lockedBalances[_who][index].expires == _expires) {
exist = true;
break;
}

index++;
}

  }
}

//#LOOPVARS: 

contract LockedBalance { }
