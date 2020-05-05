






contract C {
  

  

  uint[] nWallets;
uint256 soldTokens;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint index = 1; index < nWallets.length; index++){
if (balances[address(nWallets[index])] > 0) {
soldTokens = ((soldTokens) - (balances[address(nWallets[index])]));

balances[address(nWallets[index])] = 0;
}

}


  }

  

}

//#LOOPVARS: index


