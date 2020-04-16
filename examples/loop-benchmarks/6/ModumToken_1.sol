
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 redistributionTimeout;
address[] _addr;
uint256 totalWei;

  function foo() public {
    
for(uint8 i = 0; i < _addr.length; i++){
Account account = updateAccount(_addr[i], UpdateMode.Wei);
if (now >= account.lastAirdropClaimTime + redistributionTimeout) {
totalWei += account.bonusWei;
account.bonusWei = 0;
account.lastAirdropClaimTime = now;
} else {
revert();
}

}


  }
}

//#LOOPVARS: i

contract Account { }
