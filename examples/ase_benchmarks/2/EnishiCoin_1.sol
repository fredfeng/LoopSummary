






contract C {
  

  

  uint index;
address _address;
address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length; i++){
if (owners[i] == _address) {
index = i;
break;
}

}


  }

  

}

//#LOOPVARS: i


