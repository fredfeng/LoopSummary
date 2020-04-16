
pragma solidity ^0.5.10;



contract C {
  

  uint32[] regularTransTime;
uint256 i;

  function foo() public {
    
while(i < regularTransTime.length && now >= regularTransTime[i]){
i++;
}

  }
}

//#LOOPVARS: 
