
pragma solidity ^0.5.10;



contract C {
  

  uint256[] amountOfLands;
mapping(address => VaultInfo) vaults;
uint256 Factor;
uint256 tokensInVaults;
uint256 len;
uint256 i;
address[] holders;

  function foo() public {
    
for(uint256 i = 0; i < len; i++){
uint256 _amount = (amountOfLands[i]) * (Factor);
tokensInVaults = (tokensInVaults) - (vaults[holders[i]].amount);
vaults[holders[i]].amount = _amount;
tokensInVaults = (tokensInVaults) + (_amount);
}


  }
}

//#LOOPVARS: i

contract VaultInfo { }
