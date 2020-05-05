






contract C {
  

  

  mapping(address => bool) allowed;
address[] _allowed;

  function foo() public {
    
for(uint256 i = 0; i < _allowed.length; i++){
allowed[_allowed[i]] = true;
}


  }

  

}

//#LOOPVARS: i


