
pragma solidity ^0.5.10;



contract C {
  

  Share[] shares;
uint[] stakes;
uint totalShares;
address[] shareholders;
uint i;

  function foo() public {
    
for(uint i = 0; i < shareholders.length; i++){
shares.push(Share(shareholders[i], stakes[i]));
totalShares += stakes[i];
}


  }
}

//#LOOPVARS: i

contract Share { }
