
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256 index;
mapping(address => mapping(address => uint256)) allowed;
mapping(uint256 => TokenTransfer) tokenTransfersById;
uint256 tokenTransferCount;
address proposalCreator;
uint256[] tokenTransferIds;

  function foo() public {
    
for(uint256 index = 0; index < tokenTransferIds.length; index = (index) + (1)){
uint256 tokenTransferId = tokenTransferIds[index];
assert(tokenTransferId < tokenTransferCount);
TokenTransfer tokenTransfer = tokenTransfersById[tokenTransferId];
assert(0 < tokenTransfer.tokenCount);
assert(address(0) != tokenTransfer.source);
assert(address(0) != tokenTransfer.destination);
require(tokenTransfer.tokenCount <= balances[tokenTransfer.source]);
if (tokenTransfer.source != proposalCreator) {
require(tokenTransfer.tokenCount <= allowed[tokenTransfer.source][proposalCreator]);
allowed[tokenTransfer.source][proposalCreator] = (allowed[tokenTransfer.source][proposalCreator]) - (tokenTransfer.tokenCount);
}

balances[tokenTransfer.source] = (balances[tokenTransfer.source]) - (tokenTransfer.tokenCount);
balances[address(0)] = (balances[address(0)]) + (tokenTransfer.tokenCount);
Transfer(tokenTransfer.source, address(0), tokenTransfer.tokenCount);
}


  }
}

//#LOOPVARS: index

contract TokenTransfer { }

contract address => mappingaddress { }
