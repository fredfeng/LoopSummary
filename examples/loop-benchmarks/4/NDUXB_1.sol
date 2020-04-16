
pragma solidity ^0.5.10;



contract C {
  

  Tx[] usertxs;
uint amount;
uint it;
uint minAge;

  function foo() public {
    
for(uint it = 0; it < usertxs.length; ++it){
Tx curtx = usertxs[it];
uint diff = now - curtx.timestamp;
if (diff >= minAge) {
amount += curtx.amount;
}

}


  }
}

//#LOOPVARS: it

contract Tx { }
