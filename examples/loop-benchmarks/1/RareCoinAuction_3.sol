
pragma solidity ^0.5.10;



contract C {
  

  Bidder[] _topBids;
uint i;

  function foo() public {
    
for(uint i = 0; i < 100; ++i){
require(_topBids[i].bidderAddress != msg.sender);
}


  }
}

//#LOOPVARS: i

contract Bidder { }
