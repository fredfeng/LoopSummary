






contract C {
  

  

  uint earning;
address addr;
mapping(address => address) _inviter;
uint balance;
mapping(address => uint) _earnings;

  function foo() public {
    
while(_inviter[addr] != address(0x0)){
addr = _inviter[addr];
earning = ((balance) / (2));
balance = ((balance) - (earning));
_earnings[addr] = ((_earnings[addr]) + (earning));
}

  }

  

}

//#LOOPVARS: i


