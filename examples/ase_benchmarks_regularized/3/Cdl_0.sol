






contract C {
  

  

  uint round;
address owner;
uint roundToSharesPrice;
address[] roundAddress;
mapping(address => uint) accountKeys;
mapping(address => uint) accountRounds;
mapping(address => uint) accountShares;

  function foo() public {
    
for(uint i = 0; i < roundAddress.length; i++){
address _address = roundAddress[i];
if (accountRounds[_address] == round && _address != owner) {
accountShares[_address] = ((accountShares[_address]) + (((roundToSharesPrice) * (accountKeys[_address]))));
}

}


  }

  

}

//#LOOPVARS: i


