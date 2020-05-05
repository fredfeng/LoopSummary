






contract C {
  

  

  uint summaryTokensPercent;
mapping(address => uint) percents;
address[] wallets;

  function foo() public {
    
for(uint i = 0; i < wallets.length; i++){
summaryTokensPercent = ((summaryTokensPercent) + (percents[wallets[i]]));
}


  }

  

}

//#LOOPVARS: i


