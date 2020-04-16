
pragma solidity ^0.5.10;



contract C {
  

  uint i;
Issuer[] issuers;

  function foo() public {
    
for(uint i = 0; i < issuers.length; i++){
if (issuers[i].amount > 0) {
transferTokensOrWeiOutToIssuerOnRefund(issuers[i].addr, issuers[i].amount);
}

}


  }
}

//#LOOPVARS: i

contract Issuer { }
