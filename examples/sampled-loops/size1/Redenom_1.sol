
pragma solidity ^0.5.10;



contract C {
  

  uint _id;
uint p;
Project[] projects;

  function foo() public {
    
for(uint p = 0; p < projects.length; p++){
if (projects[p].id == _id) {
return projects[p].votesWeight;
}

}


  }
}

//#LOOPVARS: p

contract Project { }
