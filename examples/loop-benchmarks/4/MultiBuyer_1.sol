
pragma solidity ^0.5.10;



contract C {
  

  uint[] _datasIndexes;
address[] _exchanges;
uint i;
uint256[] _values;

  function foo() public {
    
for(uint i = 0; i < _exchanges.length; i++){
bytes data = new bytes(_datasIndexes[i + 1] - _datasIndexes[i]);
for (uint j = _datasIndexes[i]; j < _datasIndexes[i + 1]; j++) {
data[j - _datasIndexes[i]] = _datas[j];
}

require(_exchanges[i].call.value(_values[i])(data), "buy: exchange arbitrary call failed");
}


  }
}

//#LOOPVARS: i
