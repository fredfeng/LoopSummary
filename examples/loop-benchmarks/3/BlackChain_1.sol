
pragma solidity ^0.5.10;



contract C {
  

  uint256 countWinners;
mapping(address => address) referral;
mapping(uint256 => address[]) mirrors;
uint256 winnerTimestamp;
uint256 share;
uint i;

  function foo() public {
    
for(i = 0; i < countWinners; i++){
mirrors[winnerTimestamp][i].transfer(((share) * (9)) / (10));
referral[mirrors[winnerTimestamp][i]].transfer(((share) * (1)) / (10));
emit Payreward(mirrors[winnerTimestamp][i], share);
}


  }
}

//#LOOPVARS: i
