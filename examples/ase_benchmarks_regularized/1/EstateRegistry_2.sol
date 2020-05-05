






contract C {
  

  

  bytes32 out;
uint[] b;

  function foo() public {
    
for(uint i = 0; i < b.length; i++){
out |= bytes32(b[i] & 0xFF) >> ((i) * (8));
}


  }

  

}

//#LOOPVARS: i


