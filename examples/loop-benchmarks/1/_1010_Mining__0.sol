
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => Member) members;
uint i;
address[] memberIndex;

  function foo() public {
    
for(uint i = 0; i < memberIndex.length; i++){
members[memberIndex[i]].unpaid = (members[memberIndex[i]].unpaid) + (((members[memberIndex[i]].share) * (msg.value)) / (100));
}


  }
}

//#LOOPVARS: i

contract Member { }
