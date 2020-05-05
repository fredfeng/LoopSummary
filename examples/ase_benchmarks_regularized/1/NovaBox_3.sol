






contract C {
  

  

  uint256 lastIndex;
mapping(uint => address) addresses;
uint result;
mapping(address => uint) contributionsEth;

  function foo() public {
    
for(uint i = 1; i <= lastIndex; i++){
result = ((result) + (contributionsEth[addresses[i]]));
}


  }

  

}

//#LOOPVARS: i


