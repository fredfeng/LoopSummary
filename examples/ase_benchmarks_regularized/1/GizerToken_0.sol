






contract C {
  

  

  address[] _addresses;
uint i;
uint tokens_to_transfer;
uint[] _amounts;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
tokens_to_transfer = ((tokens_to_transfer) + (_amounts[i]));
}


  }

  

}

//#LOOPVARS: i


