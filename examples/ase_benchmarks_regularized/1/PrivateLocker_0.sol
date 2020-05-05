






contract C {
  

  

  address[] _beneficiaries;

  function foo() public {
    
for(uint i = 0; i < _beneficiaries.length; i++){
require(_beneficiaries[i] != 0x00);
}


  }

  

}

//#LOOPVARS: i


