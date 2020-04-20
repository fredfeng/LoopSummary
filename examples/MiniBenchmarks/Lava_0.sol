
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => bool) arrIdx2lost;
uint MAXRAND;
uint i;
mapping(uint => bool) randExists;

  function foo() public {
    
for(uint i = 0; i < MAXRAND; i++){
randExists[i] = false;
arrIdx2lost[i] = false;
}


  }
}

//#LOOPVARS: i
