






contract C {
  

  

  uint i;
uint[] bstr;
uint k;

  function foo() public {
    
while(i != 0){
bstr[k--] = byte(48 + i % 10);
i /= 10;
}

  }

  

}

//#LOOPVARS: i


