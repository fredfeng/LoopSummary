
pragma solidity ^0.5.10;



contract C {
  

  Proposal[] proposals;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < proposals.length; i++){
if (!proposals[i].isFinalized) {
return i;
}

}


  }
}

//#LOOPVARS: i

contract Proposal { }
