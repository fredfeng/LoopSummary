






contract C {
  

  

  uint MAXRAND;
mapping(uint => bool) arrIdx2lost;
mapping(uint => bool) randExists;

  function foo() public {
    
for(uint i = 0; i < MAXRAND; i++){
randExists[i] = false;
arrIdx2lost[i] = false;
}


  }

  

}

//#LOOPVARS: i


