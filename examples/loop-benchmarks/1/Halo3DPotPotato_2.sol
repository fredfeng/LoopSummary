
pragma solidity ^0.5.10;



contract C {
  

  uint256 CONTEST_INTERVAL;
uint256 start;

  function foo() public {
    
while(start < now){
start = SafeMath.add(start, CONTEST_INTERVAL);
}

  }
}

//#LOOPVARS: 
