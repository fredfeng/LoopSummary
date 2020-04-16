
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
address a;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
if (addresses[i] == a) {
return (i, true);
}

}


  }
}

//#LOOPVARS: i
