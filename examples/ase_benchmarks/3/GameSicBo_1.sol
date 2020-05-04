






contract C {
  

  

  uint v;
uint[] reversed;
uint i;

  function foo() public {
    
while(v != 0){
uint remainder = v % 10;
v = v / 10;
reversed[i++] = byte(48 + remainder);
}

  }

  

}

//#LOOPVARS: i


