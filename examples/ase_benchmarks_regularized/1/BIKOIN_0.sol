






contract C {
  

  

  uint256 lastIndex;
mapping(uint256 => address) addresses;
address[] addrs;

  function foo() public {
    
for(uint i = 0; i < lastIndex; i++){
addrs[i] = addresses[i + 1];
}


  }

  

}

//#LOOPVARS: i


