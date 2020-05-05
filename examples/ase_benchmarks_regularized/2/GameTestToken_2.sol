






contract C {
  

  

  uint256 sum;
uint256[] balanceRequires;

  function foo() public {
    
for(uint x = 0; x < balanceRequires.length; x++){
require(balanceRequires[x] > 0);
sum = ((sum) + (balanceRequires[x]));
}


  }

  

}

//#LOOPVARS: x


