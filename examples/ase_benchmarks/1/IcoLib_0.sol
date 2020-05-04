






contract C {
  

  

  address[] _on;
mapping(address => bool) KYC;
uint256 i;

  function foo() public {
    
for(i = 0; i < _on.length; i++){
KYC[_on[i]] = true;
}


  }

  

}

//#LOOPVARS: i


