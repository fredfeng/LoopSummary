
pragma solidity ^0.5.10;



contract C {
  

  address newOwner;
address owner;
uint i;
address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length; i++){
if (owners[i] == owner) {
owners[i] = newOwner;
break;
}

}


  }
}

//#LOOPVARS: i
