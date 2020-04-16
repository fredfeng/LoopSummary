
pragma solidity ^0.5.10;



contract C {
  

  address[] mainAccounts;
mapping(address => uint) accountCaps;
Claimable ownedContract;
bool res;
uint i;

  function foo() public {
    
for(uint i = 0; i < mainAccounts.length; i = (i) + (1)){
require(MintableToken(ownedContract).balanceOf(mainAccounts[i]) == 0);
res = MintableToken(ownedContract).mint(mainAccounts[i], accountCaps[mainAccounts[i]]) && res;
}


  }
}

//#LOOPVARS: i

contract Claimable { }
