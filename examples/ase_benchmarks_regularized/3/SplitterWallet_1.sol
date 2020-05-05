






contract C {
  

  

  uint256 num_recipients;
uint256 i;
uint256 balanceTotal;
mapping(address => uint256) balanceOf;
uint256 each;
address[] recipients;

  function foo() public {
    
for(uint i = 0; i < num_recipients; i++){
address recip = recipients[i];
balanceOf[recip] = ((balanceOf[recip]) + (each));
balanceTotal = ((balanceTotal) + (each));
}


  }

  

}

//#LOOPVARS: i


