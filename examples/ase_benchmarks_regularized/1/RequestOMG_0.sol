






contract C {
  

  

  uint _offset;
uint[] bytesString;
uint8 size;
uint[] data;

  function foo() public {
    
for(uint j = 0; j < size; j++){
bytesString[j] = data[_offset + j];
}


  }

  

}

//#LOOPVARS: j


