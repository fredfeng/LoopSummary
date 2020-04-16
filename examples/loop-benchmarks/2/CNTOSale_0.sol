
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => address) admins;
uint256 i;
uint256 aid;
uint256 adminCount;
mapping(address => uint256) adminId;

  function foo() public {
    
for(uint256 i = aid; i < adminCount; i++){
admins[i] = admins[i + 1];
adminId[admins[i]] = i;
}


  }
}

//#LOOPVARS: i
