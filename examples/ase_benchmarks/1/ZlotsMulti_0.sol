






contract C {
  

  

  mapping(address => bool) ValidBankrollAddress;
address[] UsedBankrollAddresses;

  function foo() public {
    
for(uint i = 0; i < 7; i++){
ValidBankrollAddress[UsedBankrollAddresses[i]] = true;
}


  }

  

}

//#LOOPVARS: i


