






contract C {
  

  

  address[] _confirmations;
uint i;
uint count;
address[] confirmationsTemp;

  function foo() public {
    
for(i = 0; i < count; i++){
_confirmations[i] = confirmationsTemp[i];
}


  }

  

}

//#LOOPVARS: i

