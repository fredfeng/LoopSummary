
pragma solidity ^0.5.10;



contract C {
  

  uint256 HEAD;
uint256 _tokenId;
mapping(uint256 => mapping(uint256 => Holding)) fifoStorage;
mapping(uint256 => FifoLib.LinkedList) fifo;
uint256 i;
uint256[] shares;
uint256 fifoKey;
address[] addrs;

  function foo() public {
    
while(fifoKey != HEAD){
addrs[i] = fifoStorage[_tokenId][fifoKey].owner;
shares[i] = fifoStorage[_tokenId][fifoKey].shares;
fifoKey = FifoLib.next(fifo[_tokenId], fifoKey);
i++;
}

  }
}

//#LOOPVARS: 

contract uint256 => mappinguint256 { }

contract Holding { }

contract FifoLib.LinkedList { }
