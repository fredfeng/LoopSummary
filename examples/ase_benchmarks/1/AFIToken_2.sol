






contract C {
  

  

  address[] whitelistArray;
uint256 whitelistLength;
mapping(address => uint256) snapshotBalance;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 i = 0; i < whitelistLength; i++){
snapshotBalance[whitelistArray[i]] = balances[whitelistArray[i]];
}


  }

  

}

//#LOOPVARS: i


