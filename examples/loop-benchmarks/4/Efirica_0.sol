
pragma solidity ^0.5.10;



contract C {
  

  uint256[] referralPercents;
uint256 ONE_HUNDRED_PERCENTS;
mapping(address => address) referrers;
address referrer;
uint i;

  function foo() public {
    
for(uint i = 0; referrer != address(0) && i < referralPercents.length; i++){
uint256 refAmount = ((msg.value) * (referralPercents[i])) / (ONE_HUNDRED_PERCENTS);
referrer.send(refAmount);
emit ReferrerPayed(msg.sender, referrer, refAmount);
referrer = referrers[referrer];
}


  }
}

//#LOOPVARS: i
