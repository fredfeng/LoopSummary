






contract C {
  

  

  Datasets.Beter[] winBetters;
uint256 perAmountAward;
uint256 len;

  function foo() public {
    
for(uint j = 0; j < len; j++){
addCoin(winBetters[j].betId, ((perAmountAward) * (winBetters[j].amount)), Datasets.CoinOpTypeEnum.WIN_AWARD);
}


  }

  

}

//#LOOPVARS: j



contract Datasets.Beter { }
