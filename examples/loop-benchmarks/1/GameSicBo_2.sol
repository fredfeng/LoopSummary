
pragma solidity ^0.5.10;



contract C {
  

  bytes reversed;
bytes s;
uint i;
uint j;

  function foo() public {
    
for(uint j = 0; j < i; j++){
s[j] = reversed[i - j - 1];
}


  }
}

//#LOOPVARS: j
