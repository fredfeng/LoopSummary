






contract C {
  

  

  uint256[] _tokens;
uint256 total;

  function foo() public {
    
for(uint16 index = 0; index < _tokens.length; index++){
total = ((total) + (_tokens[index]));
}


  }

  

}

//#LOOPVARS: index


