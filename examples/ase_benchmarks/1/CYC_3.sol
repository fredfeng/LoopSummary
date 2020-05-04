






contract C {
  

  

  mapping(address => uint256) balanceLocked;
address[] _addr;

  function foo() public {
    
for(uint i = 0; i < _addr.length; i++){
balanceLocked[_addr[i]] = 0;
}


  }

  

}

//#LOOPVARS: i


