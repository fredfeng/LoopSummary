
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => address) indexedGrants;
uint256 index;
uint256 totalVesting;
uint16 i;
ERC20Token token;
mapping(address => Grant) grants;

  function foo() public {
    
for(uint16 i = 0; i < index; i++){
Grant grant = grants[indexedGrants[i]];
if (grant.value == 0) continue;

uint256 vested = calculateVestedTokens(grant, now);
if (vested == 0) {
continue;
}

uint256 transferable = (vested) - (grant.transferred);
if (transferable == 0) {
continue;
}

grant.transferred = (grant.transferred) + (transferable);
totalVesting = (totalVesting) - (transferable);
token.mintTokens(indexedGrants[i], transferable);
emit UnlockGrant(msg.sender, transferable);
}


  }
}

//#LOOPVARS: i

contract Grant { }

contract ERC20Token { }
