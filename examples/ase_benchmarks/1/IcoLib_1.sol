






contract C {
  

  

  mapping(address => bool) KYC;
uint256 i;
address[] _off;

  function foo() public {
    
for(i = 0; i < _off.length; i++){
delete KYC[_off[i]];
}


  }

  

}

//#LOOPVARS: i


