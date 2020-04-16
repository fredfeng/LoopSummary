
pragma solidity ^0.5.10;



contract C {
  

  uint256 index;
address _owner;
mapping(address => LockedBalance[]) lockedBalances;
uint256 locked;
uint256 _expires;
uint256 time;

  function foo() public {
    
while(index < lockedBalances[_owner].length){
if (_expires > 0) {
if (lockedBalances[_owner][index].expires == _expires) {
locked = (locked) + (lockedBalances[_owner][index].value);
}

} else {
if (lockedBalances[_owner][index].expires >= time) {
locked = (locked) + (lockedBalances[_owner][index].value);
}

}

index++;
}

  }
}

//#LOOPVARS: 

contract LockedBalance { }
