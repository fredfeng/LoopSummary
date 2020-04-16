
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address[] listAddresses;
uint256 i;
address multisig;
uint256 _icoSupply;
uint256[] bonus;
uint256 totalNumberTokenSold;

  function foo() public {
    
for(uint256 i = 0; i < listAddresses.length; i++){
require(listAddresses[i] != 0x0);
balances[listAddresses[i]] = (balances[listAddresses[i]]) + (bonus[i]);
balances[multisig] = (balances[multisig]) - (bonus[i]);
totalNumberTokenSold = (totalNumberTokenSold) + (bonus[i]);
_icoSupply = (_icoSupply) - (bonus[i]);
}


  }
}

//#LOOPVARS: i
