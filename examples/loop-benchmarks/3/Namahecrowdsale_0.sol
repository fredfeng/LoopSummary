
pragma solidity ^0.5.10;



contract C {
  

  address _reserve;
address[] allocatedAddresses;
uint256 unapprovedTokens;
address _founder_one;
uint256 i;
address _founder_two;
mapping(address => uint256) allocated;

  function foo() public {
    
for(uint256 i = 0; i < allocatedAddresses.length; i++){
if (allocatedAddresses[i] != _founder_one && allocatedAddresses[i] != _founder_two && allocatedAddresses[i] != _reserve) {
unapprovedTokens = (unapprovedTokens) + (allocated[allocatedAddresses[i]]);
allocated[allocatedAddresses[i]] = 0;
}

}


  }
}

//#LOOPVARS: i
