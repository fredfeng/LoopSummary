
pragma solidity ^0.5.10;



contract C {
  

  Bidder[] _topBids;
uint total;
uint i;

  function foo() public {
    
for(uint i = 0; i < 100; ++i){
total = (total) + (_topBids[i].bid);
}


  }
}

//#LOOPVARS: i

contract Bidder { }
