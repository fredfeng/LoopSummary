






contract C {
  

  

  uint256 i;
mapping(address => bool) transferRight;
address[] _disallow;

  function foo() public {
    
for(uint i = 0; i < _disallow.length; i++){
delete transferRight[_disallow[i]];
}


  }

  

}

//#LOOPVARS: i


