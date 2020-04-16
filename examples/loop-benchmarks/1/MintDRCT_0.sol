
pragma solidity ^0.5.10;



contract C {
  

  address[] mainAccounts;
mapping(address => uint) accountCaps;
uint8[] mainPercentages;
uint i;
uint256 TOTAL_SUPPLY_CAP;

  function foo() public {
    
for(uint i = 0; i < mainAccounts.length; i = (i) + (1)){
accountCaps[mainAccounts[i]] = TOTAL_SUPPLY_CAP * mainPercentages[i] / 100;
}


  }
}

//#LOOPVARS: i
