
pragma solidity ^0.5.10;



contract C {
  

  Bidder[] _topBids;
address[] tempArray;
uint i;

  function foo() public {
    
for(uint i = 0; i < 100; ++i){
tempArray[i] = _topBids[i].bidderAddress;
}


  }
}

//#LOOPVARS: i

contract Bidder { }
