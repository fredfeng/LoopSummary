
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => TxInfo) txBuffer;
uint txBufferMaxSize;
address[] _owners;
uint[] _types;
uint256[] _prices;
uint offset;
uint256[] _itemIds;
uint i;
uint[] _ts;

  function foo() public {
    
for(uint i = 0; i < txBufferMaxSize; i++){
_owners[i] = txBuffer[offset].owner;
_itemIds[i] = txBuffer[offset].itemId;
_prices[i] = txBuffer[offset].price;
_types[i] = txBuffer[offset].txType;
_ts[i] = txBuffer[offset].timestamp;
offset = offset > 0 ? offset - 1, txBufferMaxSize - 1;
}


  }
}

//#LOOPVARS: i

contract TxInfo { }
