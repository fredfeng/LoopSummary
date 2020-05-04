






contract C {
  

  

  mapping(address => bool) kyclist;
address[] _beneficiaries;

  function foo() public {
    
for(uint256 i = 0; i < _beneficiaries.length; i++){
kyclist[_beneficiaries[i]] = true;
}


  }

  

}

//#LOOPVARS: i


