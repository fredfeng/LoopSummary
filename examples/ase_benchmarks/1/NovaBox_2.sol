






contract C {
  

  

  mapping(address => uint) contributionsToken;
uint256 lastIndex;
mapping(uint => address) addresses;
uint result;

  function foo() public {
    
for(uint i = 1; i <= lastIndex; i++){
result = ((result) + (contributionsToken[addresses[i]]));
}


  }

  

}

//#LOOPVARS: i


