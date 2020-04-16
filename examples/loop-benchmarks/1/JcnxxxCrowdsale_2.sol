
pragma solidity ^0.5.10;



contract C {
  

  uint i;
mapping(uint => Phase) ico;

  function foo() public {
    
for(uint i = 0; i < 5; i++){
if (ico[i].startTime <= now && ico[i].endTime >= now) {
return ico[i].minimum;
}

}


  }
}

//#LOOPVARS: i

contract Phase { }
