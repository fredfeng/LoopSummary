






contract C {
  

  

  mapping(address => bool) whitelist;
address[] _beneficiaries;

  function foo() public {
    
for(uint256 i = 0; i < _beneficiaries.length; i++){
whitelist[_beneficiaries[i]] = true;
}


  }

  

}

//#LOOPVARS: i


