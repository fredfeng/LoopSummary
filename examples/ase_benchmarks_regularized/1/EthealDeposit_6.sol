






contract C {
  

  

  uint256 from;
uint256 i;
uint256[] ids;
uint256 results;
uint256 to;
uint256[] _ids;

  function foo() public {
    
for(uint i = from; i <= to && i < results; i++){
ids[i] = _ids[i];
}


  }

  

}

//#LOOPVARS: i


