
pragma solidity ^0.5.10;



contract C {
  

  uint[] _datasIndexes;
bytes data;
uint j;
bytes _datas;
uint i;

  function foo() public {
    
for(uint j = _datasIndexes[i]; j < _datasIndexes[i + 1]; j++){
data[j - _datasIndexes[i]] = _datas[j];
}


  }
}

//#LOOPVARS: j
