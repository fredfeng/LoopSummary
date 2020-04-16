
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) KYCDone;
address[] contributorsList;
uint256 i;
LoveToken token;

  function foo() public {
    
for(uint256 i = 0; i < contributorsList.length; i++){
address addr = contributorsList[i];
KYCDone[addr] = true;
KYCApproved(addr);
token.release(addr);
}


  }
}

//#LOOPVARS: i

contract LoveToken { }
