






contract C {
  

  

  mapping(address => uint) contributionsToken;
uint256 lastIndex;
mapping(uint => address) addresses;
uint[] _contributions;
address[] _addrs;

  function foo() public {
    
for(uint i = 1; i <= lastIndex; i++){
_addrs[i - 1] = addresses[i];
_contributions[i - 1] = contributionsToken[addresses[i]];
}


  }

  

}

//#LOOPVARS: i


