






contract C {
  

  

  address[] accountAddresses;
uint i;

  function foo() public {
    
while(i < ((accountAddresses.length) - (1))){
accountAddresses[i] = accountAddresses[((i) + (1))];
i = ((i) + (1));
}

  }

  

}

//#LOOPVARS: i


