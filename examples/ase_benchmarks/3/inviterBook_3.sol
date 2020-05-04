






contract C {
  

  

  uint256 _length;
bool _hasNonNumber;
uint[] _temp;

  function foo() public {
    
for(uint256 i = 0; i < _length; i++){
require((_temp[i] > 0x40 && _temp[i] < 0x5b) || (_temp[i] > 0x60 && _temp[i] < 0x7b) || (_temp[i] > 0x2f && _temp[i] < 0x3a));
if (_hasNonNumber == false && _temp[i] > 0x3a) _hasNonNumber = true;

}


  }

  

}

//#LOOPVARS: i


