






contract C {
  

  

  address[] _recipients;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(_recipients[i] != address(0));
}


  }

  

}

//#LOOPVARS: i


