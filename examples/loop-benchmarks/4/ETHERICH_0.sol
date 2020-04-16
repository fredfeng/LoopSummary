
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => address) members;
address referrer;
uint[] REFERRAL_RATE;
uint16 i;

  function foo() public {
    
for(uint16 i = 0; i < 5; i++){
if (referrer == 1) {
break;
}

uint256 amount = SafeMath.div(SafeMath.mul(msg.value, REFERRAL_RATE[i]), 100);
referrer.transfer(amount);
referrer = members[referrer];
}


  }
}

//#LOOPVARS: i
