
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256 index;
mapping(uint256 => TokenTransfer) tokenTransfersById;
uint256 tokenTransferCount;
uint256[] tokenTransferIds;

  function foo() public {
    
for(uint256 index = 0; index < tokenTransferIds.length; index = (index) + (1)){
uint256 tokenTransferId = tokenTransferIds[index];
assert(tokenTransferId < tokenTransferCount);
TokenTransfer tokenTransfer = tokenTransfersById[tokenTransferId];
assert(0 < tokenTransfer.tokenCount);
assert(address(0) != tokenTransfer.source);
assert(address(0) != tokenTransfer.destination);
assert(tokenTransfer.tokenCount <= balances[address(0)]);
balances[tokenTransfer.source] = (balances[tokenTransfer.source]) + (tokenTransfer.tokenCount);
balances[address(0)] = (balances[address(0)]) - (tokenTransfer.tokenCount);
Transfer(address(0), tokenTransfer.source, tokenTransfer.tokenCount);
}


  }
}

//#LOOPVARS: index

contract TokenTransfer { }
