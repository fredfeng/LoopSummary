






contract C {
  

  

  uint[] _datas;
uint i;
uint[] data;
uint[] _datasIndexes;

  function foo() public {
    
for(uint j = _datasIndexes[i]; j < _datasIndexes[i + 1]; j++){
data[j - _datasIndexes[i]] = _datas[j];
}


  }

  

}

//#LOOPVARS: j


