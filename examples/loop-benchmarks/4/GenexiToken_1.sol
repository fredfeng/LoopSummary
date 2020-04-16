
pragma solidity ^0.5.10;



contract C {
  

  uint256 soldTokens;
uint[] nWallets;
uint index;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint index = 1; index < nWallets.length; index++){
if (balances[address(nWallets[index])] > 0) {
soldTokens = (soldTokens) - (balances[address(nWallets[index])]);
Burn(address(nWallets[index]), balances[address(nWallets[index])]);
balances[address(nWallets[index])] = 0;
}

}


  }
}

//#LOOPVARS: index
