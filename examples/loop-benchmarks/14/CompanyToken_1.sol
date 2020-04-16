
pragma solidity ^0.5.10;



contract C {
  

  uint256 HEAD;
uint256 _sharesToFulfill;
uint256 _tokenId;
uint256 totalPayment;
mapping(uint256 => mapping(uint256 => Holding)) fifoStorage;
mapping(uint256 => FifoLib.LinkedList) fifo;
uint256 fifoKey;
uint256 prevFifoKey;
uint256 sharesFulfilled;

  function foo() public {
    
while(fifoKey != HEAD){
Holding holding = fifoStorage[_tokenId][fifoKey];
assert(holding.shares > 0);
if (holding.owner != msg.sender) {
uint256 itemSharesFulfilled;
uint256 itemPayment;
(itemSharesFulfilled, itemPayment) = _purchaseProcessFifoItem(_tokenId, holding, SafeMath.sub(_sharesToFulfill, sharesFulfilled));
sharesFulfilled += itemSharesFulfilled;
totalPayment += itemPayment;
if (holding.shares == 0) {
FifoLib.remove(fifo[_tokenId], prevFifoKey, fifoKey);
fifoKey = prevFifoKey;
}

}

if (sharesFulfilled == _sharesToFulfill) break;

prevFifoKey = fifoKey;
fifoKey = FifoLib.next(fifo[_tokenId], fifoKey);
}

  }
}

//#LOOPVARS: 

contract Holding { }

contract uint256 => mappinguint256 { }

contract FifoLib.LinkedList { }
