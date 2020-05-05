






contract C {
  

  

  uint256 i;
mapping(address => bool) whitelist;
address[] _beneficiaries;

  function foo() public {
    
for(uint i = 0; i < _beneficiaries.length; i++){
whitelist[_beneficiaries[i]] = true;
}


  }

  

}

//#LOOPVARS: i


