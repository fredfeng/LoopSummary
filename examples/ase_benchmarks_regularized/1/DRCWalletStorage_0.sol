






contract C {
  

  

  address _deposit;
uint i;
address[] depositAddresses;

  function foo() public {
    
for(uint i; i < depositAddresses.length; i = ((i) + (1))){
if (depositAddresses[i] == _deposit) {
break;
}

}


  }

  

}

//#LOOPVARS: i


