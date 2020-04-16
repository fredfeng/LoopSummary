
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address[] listAddresses;
uint256 i;
mapping(address => uint256) balancesWaitingKYC;
address multisig;

  function foo() public {
    
for(uint256 i = 0; i < listAddresses.length; i++){
address client = listAddresses[i];
balances[multisig] = (balances[multisig]) - (balancesWaitingKYC[client]);
balances[client] = (balances[client]) + (balancesWaitingKYC[client]);
balancesWaitingKYC[client] = 0;
}


  }
}

//#LOOPVARS: i
