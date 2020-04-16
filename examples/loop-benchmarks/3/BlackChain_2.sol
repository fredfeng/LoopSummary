
pragma solidity ^0.5.10;



contract C {
  

  uint256 countSecondWinners;
mapping(address => address) referral;
mapping(uint256 => address[]) mirrors;
uint256 secondWinnerTimestamp;
uint256 share;
uint i;

  function foo() public {
    
for(i = 0; i < countSecondWinners; i++){
mirrors[secondWinnerTimestamp][i].transfer(((share) * (9)) / (10));
referral[mirrors[secondWinnerTimestamp][i]].transfer(((share) * (1)) / (10));
emit Payreward(mirrors[secondWinnerTimestamp][i], share);
}


  }
}

//#LOOPVARS: i
