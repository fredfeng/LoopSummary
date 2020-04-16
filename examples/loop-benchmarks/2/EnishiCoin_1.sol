
pragma solidity ^0.5.10;



contract C {
  

  address _address;
uint index;
uint i;
address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length; i++){
if (owners[i] == _address) {
index = i;
break;
}

}


  }
}

//#LOOPVARS: i
