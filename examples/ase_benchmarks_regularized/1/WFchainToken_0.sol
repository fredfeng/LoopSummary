






contract C {
  

  

  uint256 len;
uint256[] timestamps;
address[] targets;
mapping(address => uint256) frozenAccount;

  function foo() public {
    
for(uint256 i = 0; i < len; i = ((i) + (1))){
frozenAccount[targets[i]] = timestamps[i];
}


  }

  

}

//#LOOPVARS: i


