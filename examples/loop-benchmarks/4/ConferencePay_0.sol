
pragma solidity ^0.5.10;



contract C {
  

  Talk[] talks;
uint max;
uint i;
address winnerAddress;

  function foo() public {
    
for(uint i = 0; i < talks.length; i++){
if (talks[i].amount > max) {
max = talks[i].amount;
winnerAddress = talks[i].addr;
}

talks[i].addr.transfer(((talks[i].amount) * (70)) / (100));
}


  }
}

//#LOOPVARS: i

contract Talk { }
