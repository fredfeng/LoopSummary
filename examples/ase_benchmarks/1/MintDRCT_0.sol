






contract C {
  

  

  address[] mainAccounts;
mapping(address => uint) accountCaps;
uint256 TOTAL_SUPPLY_CAP;
uint8[] mainPercentages;

  function foo() public {
    
for(uint i = 0; i < mainAccounts.length; i = ((i) + (1))){
accountCaps[mainAccounts[i]] = TOTAL_SUPPLY_CAP * mainPercentages[i] / 100;
}


  }

  

}

//#LOOPVARS: i


