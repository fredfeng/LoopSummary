






contract C {
  

  

  mapping(address => address) _inviter;
address addr;

  function foo() public {
    
while(_inviter[addr] != address(0x0)){
addr = _inviter[addr];
}

  }

  

}

//#LOOPVARS: i


