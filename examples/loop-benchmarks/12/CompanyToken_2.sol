
pragma solidity ^0.5.10;



contract C {
  

  uint256 sharesToFulfill;
uint256 HEAD;
address _from;
uint256 _tokenId;
mapping(uint256 => mapping(uint256 => Holding)) fifoStorage;
address _to;
mapping(uint256 => FifoLib.LinkedList) fifo;
uint256 fifoKey;

  function foo() public {
    
while(fifoKey != HEAD){
Holding holding = fifoStorage[_tokenId][fifoKey];
assert(holding.shares > 0);
if (holding.owner == _from) {
uint256 fulfilled = Math.min(holding.shares, sharesToFulfill);
if (holding.shares == fulfilled) {
holding.owner = _to;
} else {
holding.shares -= fulfilled;
fifoStorage[_tokenId][FifoLib.insert(fifo[_tokenId], fifoKey, _nextFifoStorageKey(_tokenId))] = Holding(_to, fulfilled);
fifoKey = FifoLib.next(fifo[_tokenId], fifoKey);
}

sharesToFulfill -= fulfilled;
}

if (sharesToFulfill == 0) break;

fifoKey = FifoLib.next(fifo[_tokenId], fifoKey);
}

  }
}

//#LOOPVARS: 

contract uint256 => mappinguint256 { }

contract Holding { }

contract FifoLib.LinkedList { }
