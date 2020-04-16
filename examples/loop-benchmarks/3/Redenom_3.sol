
pragma solidity ^0.5.10;



contract C {
  

  uint _id;
Project[] projects;
uint epoch;
mapping(address => Account) accounts;
uint p;

  function foo() public {
    
for(uint p = 0; p < projects.length; p++){
if (projects[p].id == _id && projects[p].active == true) {
projects[p].votesWeight += sqrt(accounts[msg.sender].balance);
accounts[msg.sender].lastVotedEpoch = epoch;
}

}


  }
}

//#LOOPVARS: p

contract Account { }

contract Project { }
