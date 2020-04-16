
pragma solidity ^0.5.10;



contract C {
  

  address[] managers;
address manager;
uint i;

  function foo() public {
    
for(uint i = 0; i < managers.length; i++){
if (managers[i] == manager) {
managers[i] = managers[managers.length - 1];
break;
}

}


  }
}

//#LOOPVARS: i
