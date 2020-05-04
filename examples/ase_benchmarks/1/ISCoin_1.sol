






contract C {
  

  

  uint256 totalLockedBalance;
address[] timelockAddrs;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < timelockAddrs.length; i++){
totalLockedBalance = ((totalLockedBalance) + (balances[timelockAddrs[i]]));
}


  }

  

}

//#LOOPVARS: i


