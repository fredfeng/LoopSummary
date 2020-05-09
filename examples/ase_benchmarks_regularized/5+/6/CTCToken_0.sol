






contract C {
  

  

  mapping(address => uint256) balancesWaitingKYC;
uint256 totalNumberTokenSold;
address multisig;
address[] listAddresses;
mapping(address => uint256) balances;
uint256 _icoSupply;

  function foo() public {
    
for(uint256 i = 0; i < listAddresses.length; i++){
address client = listAddresses[i];
balances[multisig] = ((balances[multisig]) - (balancesWaitingKYC[client]));
balances[client] = ((balances[client]) + (balancesWaitingKYC[client]));
totalNumberTokenSold = ((totalNumberTokenSold) + (balancesWaitingKYC[client]));
_icoSupply = ((_icoSupply) - (balancesWaitingKYC[client]));
balancesWaitingKYC[client] = 0;
}


  }

  

}

//#LOOPVARS: i


