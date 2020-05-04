






contract C {
  

  

  address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length; i++){
if (owners[i] == msg.sender) {
_;
}

}


  }

  

}

//#LOOPVARS: i


