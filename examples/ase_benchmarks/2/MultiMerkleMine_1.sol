






contract C {
  

  

  uint256 src;
uint256 WORD_SIZE;
uint256 dest;
uint256 len;

  function foo() public {
    
for(; len >= WORD_SIZE; len -= WORD_SIZE){
assembly {\n                mstore(dest, mload(src))\n            }
dest += WORD_SIZE;
src += WORD_SIZE;
}


  }

  

}

//#LOOPVARS: len


