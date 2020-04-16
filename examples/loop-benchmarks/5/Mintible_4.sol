
pragma solidity ^0.5.10;



contract C {
  

  uint64 i;
uint256 j;
uint64[] _supplies;
uint256[] _creationData;
uint64 indexOffset;
uint128[] _prices;

  function foo() public {
    
for(uint64 i = indexOffset; i < (indexOffset) + (uint64(_prices.length)); i++){
_create(i, _prices[(i) - (indexOffset)], _supplies[(i) - (indexOffset)]);
if (_creationData[j] > 0) {
_handleData(_creationData, i, j, indexOffset, _prices.length);
j = ((j) + (4)) + ((_creationData[j]) * (2));
} else {
j = (j) + (1);
}

}


  }
}

//#LOOPVARS: i
