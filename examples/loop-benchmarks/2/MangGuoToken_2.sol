
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint8 _count;
uint256 releaseTime;
address _to;
uint256 _amount;

  function foo() public {
    
for(uint8 i = 0; i < _count; i++){
releaseTime = (releaseTime) + (86400 * 30);
setItemOption(_to, _amount, releaseTime);
}


  }
}

//#LOOPVARS: i
