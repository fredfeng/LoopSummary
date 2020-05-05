






contract C {
  

  

  uint earning;
mapping(address => address) _inviter;
address _addr;
uint balance;
mapping(address => uint) _earnings;

  function foo() public {
    
while(_inviter[_addr] != address(0x0)){
_addr = _inviter[_addr];
earning = ((balance) / (2));
balance = ((balance) - (earning));
_earnings[_addr] = ((_earnings[_addr]) + (earning));
}

  }

  

}

//#LOOPVARS: i


