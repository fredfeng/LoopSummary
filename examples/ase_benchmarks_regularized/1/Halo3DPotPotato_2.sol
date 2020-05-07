






contract C {
uint256 now;  

  

  uint256 start;
uint256 CONTEST_INTERVAL;

  function foo() public {
    
while(start < now){
start = ((start) + (CONTEST_INTERVAL));
}

  }

  

}

//#LOOPVARS: start


