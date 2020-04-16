
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => address) lockToOwner;
uint counter;
uint[] result;
uint i;
LoveBlock[] locks;

  function foo() public {
    
for(uint i = 0; i < locks.length; i++){
if (msg.sender == lockToOwner[i]) {
result[counter] = i;
counter = (counter) + (1);
}

}


  }
}

//#LOOPVARS: i

contract LoveBlock { }
