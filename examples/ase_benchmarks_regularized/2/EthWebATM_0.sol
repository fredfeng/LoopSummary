






contract C {
  

  

  uint256[] shares;
address[] receivers;
uint256 totalshares;

  function foo() public {
    
for(uint256 i = 0; i < receivers.length; i++){
require(shares[i] > 0);
totalshares = ((totalshares) + (shares[i]));
}


  }

  

}

//#LOOPVARS: i


