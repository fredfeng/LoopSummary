






contract C {
  

  

  mapping(address => bytes32) signetures;
address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length; i++){
signetures[owners[i]] = bytes32(i + 1);
}


  }

  

}

//#LOOPVARS: i


