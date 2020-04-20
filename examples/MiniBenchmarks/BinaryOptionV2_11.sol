
pragma solidity ^0.5.10;



contract C {
  

  address owner;
uint i;
address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length - 1; i++){
if (owners[i] == owner) {
owners[i] = owners[owners.length - 1];
break;
}

}


  }
}

//#LOOPVARS: i
