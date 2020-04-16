
pragma solidity ^0.5.10;



contract C {
  

  Bidder[] _topBids;
uint startPos;
uint i;

  function foo() public {
    
for(uint i = 99; i < 100; --i){
if (_topBids[i].bidderAddress == msg.sender) {
startPos = i;
break;
}

}


  }
}

//#LOOPVARS: i

contract Bidder { }
