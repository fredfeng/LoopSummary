






contract C {
  

  

  uint256 distributedCount;
address[] participants;
uint256 total;

  function foo() public {
    
for(uint i = 0; i < participants.length; i++){
address participant = participants[distributedCount + i];
total += participant.balance;
}


  }

  

}

//#LOOPVARS: i


