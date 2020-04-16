
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => InvestorTokenVault) investorVaults;
uint256 locks;
uint256 id;
uint256 i;
uint256 count;
uint256 withdrawable;

  function foo() public {
    
for((i < locks) && (count < 50); i++){
if (investorVaults[id].lockTime[i] < now) {
withdrawable = (withdrawable) + (investorVaults[id].lockValue[i]);
investorVaults[id].withdraws = i + 1;
}

count++;
}


  }
}

//#LOOPVARS: 

contract InvestorTokenVault { }
