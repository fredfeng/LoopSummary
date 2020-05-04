






contract C {
  

  

  address[] _excludedRecipients;
mapping(address => bool) excludedFromTokenUnlock;

  function foo() public {
    
for(uint256 i = 0; i < _excludedRecipients.length; i++){
excludedFromTokenUnlock[_excludedRecipients[i]] = false;

}


  }

  

}

//#LOOPVARS: i


