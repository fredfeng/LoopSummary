
pragma solidity ^0.5.10;



contract C {
  

  uint amountToDistribute;
uint i;
Issuer[] issuers;

  function foo() public {
    
while(amountToDistribute > 0){
if (issuers[i].amount > 0) {
if (issuers[i].amount >= amountToDistribute) {
transferTokensOrWeiOutToIssuerOnExecute(issuers[i].addr, amountToDistribute);
issuers[i].amount = (issuers[i].amount) - (amountToDistribute);
amountToDistribute = 0;
} else {
transferTokensOrWeiOutToIssuerOnExecute(issuers[i].addr, issuers[i].amount);
amountToDistribute = (amountToDistribute) - (issuers[i].amount);
issuers[i].amount = 0;
}

}

i = i - 1;
}

  }
}

//#LOOPVARS: 

contract Issuer { }
