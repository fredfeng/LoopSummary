
pragma solidity ^0.5.10;



contract C {
  

  Bidder[] _topBids;
uint startPos;
uint j;
uint proposedBid;
uint endPos;

  function foo() public {
    
for(uint j = startPos; j < 100; --j){
if (j != 0 && proposedBid > _topBids[j - 1].bid) {
_topBids[j] = _topBids[j - 1];
} else {
_topBids[j].bid = proposedBid;
_topBids[j].bidderAddress = msg.sender;
endPos = j;
break;
}

}


  }
}

//#LOOPVARS: j

contract Bidder { }
