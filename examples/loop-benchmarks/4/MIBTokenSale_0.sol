
pragma solidity ^0.5.10;



contract C {
  

  uint8 k;
uint[] rate;
mapping(uint8 => uint) nowTokensperEth;
uint8[] sep;
mapping(uint8 => uint) assignTokensperType;
uint[] vesting;
mapping(uint8 => uint) distributionTimes;
mapping(uint8 => uint) remainTokensperType;

  function foo() public {
    
for(k = 0; k < uint8(InvestTypes.MAX_InvestTypes); k++){
remainTokensperType[k] = (remainTokensperType[k]) + (vesting[k] * 1e18);
assignTokensperType[k] = (assignTokensperType[k]) + (vesting[k] * 1e18);
nowTokensperEth[k] = rate[k];
distributionTimes[k] = sep[k];
}


  }
}

//#LOOPVARS: k
