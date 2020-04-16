
pragma solidity ^0.5.10;



contract C {
  

  address[] managers;
address manager;
uint i;

  function foo() public {
    
for(uint i = 0; i < managers.length; i++){
if (managers[i] == manager) {
return true;
}

}


  }
}

//#LOOPVARS: i
