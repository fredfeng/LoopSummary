






contract C {
  

  

  uint result;
uint[] b;

  function foo() public {
    
for(uint i = 0; i < b.length; i++){
uint c = uint(b[i]);
if (c >= 48 && c <= 57) {
result = result * 16 + (c - 48);
}

if (c >= 65 && c <= 90) {
result = result * 16 + (c - 55);
}

if (c >= 97 && c <= 122) {
result = result * 16 + (c - 87);
}

}


  }

  

}

//#LOOPVARS: i


