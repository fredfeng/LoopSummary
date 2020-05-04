






contract C {
  

  

  address _target;
uint256 len;
address[] frozenAccounts;

  function foo() public {
    
for(uint256 i = 0; i < len; i = ((i) + (1))){
if (frozenAccounts[i] == _target) {
break;
}

}


  }

  

}

//#LOOPVARS: i


