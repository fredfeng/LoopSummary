






contract C {
  

  

  uint allTokens;
uint percentRate;
mapping(address => uint) percents;
address[] wallets;

  function foo() public {
    
for(uint k = 0; k < wallets.length; k++){
mintTokens(wallets[k], ((((allTokens) * (percents[wallets[k]]))) / (percentRate)));
}


  }

  

}

//#LOOPVARS: k


