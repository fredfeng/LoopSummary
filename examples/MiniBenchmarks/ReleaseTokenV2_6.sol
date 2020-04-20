
pragma solidity ^0.5.10;



contract C {
  

  address[] frozenAccounts;
uint256 len;
address _target;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < len; i = (i) + (1)){
if (frozenAccounts[i] == _target) {
break;
}

}


  }
}

//#LOOPVARS: i
