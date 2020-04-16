
pragma solidity ^0.5.10;



contract C {
  

  uint _id;
uint p;
Project[] projects;

  function foo() public {
    
for(uint p = 0; p < projects.length; p++){
if (projects[p].id == _id) {
if (projects[p].active == true) {
projects[p].active = false;
} else {
projects[p].active = true;
}

}

}


  }
}

//#LOOPVARS: p

contract Project { }
