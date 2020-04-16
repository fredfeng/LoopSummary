
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => InvestorTokenVault) investorVaults;
uint256 withdraws;
uint256 unlocked;
uint256 locks;
uint256 i;
uint256 locked;
uint256 _id;
uint256 withdrawable;

  function foo() public {
    
for(uint256 i = withdraws; i < locks; i++){
if (investorVaults[_id].lockTime[i] < now) {
unlocked = un(locked) + (investorVaults[_id].lockValue[i]);
if (i - withdraws < 50) withdrawable = (withdrawable) + (investorVaults[_id].lockValue[i]);

} else {
locked = (locked) + (investorVaults[_id].lockValue[i]);
}

}


  }
}

//#LOOPVARS: i

contract InvestorTokenVault { }
