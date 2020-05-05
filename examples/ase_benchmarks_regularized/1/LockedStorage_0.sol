






contract C {
  

  

  address _wallet;
uint i;
address[] accountAddresses;

  function foo() public {
    
for(uint i; i < accountAddresses.length; i = ((i) + (1))){
if (accountAddresses[i] == _wallet) {
break;
}

}


  }

  

}

//#LOOPVARS: i


