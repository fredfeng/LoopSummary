






contract C {
  

  

  uint256 start;
uint256 CONTEST_INTERVAL;

  function foo() public {
    
while(start < block.timestamp){
start = ((start) + (CONTEST_INTERVAL));
}

  }

  

}

//#LOOPVARS: i


