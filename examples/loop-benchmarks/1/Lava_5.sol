
pragma solidity ^0.5.10;



contract C {
  

  uint MAXRAND;
mapping(uint => bool) arrIdx2lost;
uint i;

  function foo() public {
    
for(i = 0; i < MAXRAND; i++){
arrIdx2lost[i] = true;
}


  }
}

//#LOOPVARS: i
