






contract C {
  

  

  uint src;
uint dest;
uint len;

  function foo() public {
    
for(; len >= 32; len -= 32){
assembly {\n                mstore(dest, mload(src))\n            }
dest += 32;
src += 32;
}


  }

  

}

//#LOOPVARS: len


