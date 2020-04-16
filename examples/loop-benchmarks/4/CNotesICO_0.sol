
pragma solidity ^0.5.10;



contract C {
  

  address[] tokenHolders;
mapping(address => uint256) recordBalance;
uint i;

  function foo() public {
    
for(uint i = 0; i < ((tokenHolders.length) - (1)); i++){
address holder = getTokenHolder(i);
uint256 holderBal = balanceOf(holder);
addRecordEntry(holder);
recordBalance[holder] = holderBal;
}


  }
}

//#LOOPVARS: i
