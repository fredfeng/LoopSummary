
pragma solidity ^0.5.10;



contract C {
  

  bytes _temp;
uint256 _length;
bool _hasNonNumber;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _length; i++){
if (_temp[i] > 0x40 && _temp[i] < 0x5b) {
_temp[i] = byte(uint(_temp[i]) + 32);
if (_hasNonNumber == false) _hasNonNumber = true;

} else {
require(_temp[i] == 0x20 || (_temp[i] > 0x60 && _temp[i] < 0x7b) || (_temp[i] > 0x2f && _temp[i] < 0x3a), "string contains invalid characters");
if (_temp[i] == 0x20) require(_temp[i + 1] != 0x20, "string cannot contain consecutive spaces");

if (_hasNonNumber == false && (_temp[i] < 0x30 || _temp[i] > 0x39)) _hasNonNumber = true;

}

}


  }
}

//#LOOPVARS: i
