






contract C {
  

  

  uint MAXRAND;
uint i;
mapping(uint => bool) arrIdx2lost;

  function foo() public {
    
for(i = 0; i < MAXRAND; i++){
arrIdx2lost[i] = true;
}


  }

  

}

//#LOOPVARS: i


