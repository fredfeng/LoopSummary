
pragma solidity ^0.5.10;



contract C {
  

  uint amount;
uint i;
bool found;
Issuer[] issuers;

  function foo() public {
    
for(uint i = 0; i < issuers.length; i++){
if (issuers[i].addr == msg.sender) {
issuers[i].amount = (issuers[i].amount) + (amount);
found = true;
break;
}

}


  }
}

//#LOOPVARS: i

contract Issuer { }
