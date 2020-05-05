






contract C {
  

  

  uint256 i;
mapping(address => bool) transferRight;
address[] _allow;

  function foo() public {
    
for(uint i = 0; i < _allow.length; i++){
transferRight[_allow[i]] = true;
}


  }

  

}

//#LOOPVARS: i


