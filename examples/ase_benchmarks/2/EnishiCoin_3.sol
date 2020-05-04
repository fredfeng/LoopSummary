






contract C {
  

  

  mapping(address => bytes32) signetures;
bool success;
bytes32 signeture;
address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length; i++){
if (signeture != signetures[owners[i]]) {
success = false;
}

}


  }

  

}

//#LOOPVARS: i


