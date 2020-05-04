






contract C {
  

  

  address[] _batchOfAddresses;
mapping(address => bool) whiteList;

  function foo() public {
    
for(uint256 i = 0; i < _batchOfAddresses.length; i++){
whiteList[_batchOfAddresses[i]] = true;
}


  }

  

}

//#LOOPVARS: i


