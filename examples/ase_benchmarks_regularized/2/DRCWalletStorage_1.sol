






contract C {
  

  

  address[] depositAddresses;
uint i;

  function foo() public {
    
while(i < ((depositAddresses.length) - (1))){
depositAddresses[i] = depositAddresses[((i) + (1))];
i = ((i) + (1));
}

  }

  

}

//#LOOPVARS: i


