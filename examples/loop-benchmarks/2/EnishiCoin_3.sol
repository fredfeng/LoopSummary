
pragma solidity ^0.5.10;



contract C {
  

  bool success;
bytes32 signeture;
mapping(address => bytes32) signetures;
uint i;
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
