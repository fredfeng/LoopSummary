






contract C {
  

  

  address[] _recipients;
mapping(address => bool) tokensReceived;
mapping(address => bool) craneList;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(!tokensReceived[_recipients[i]]);
require(!craneList[_recipients[i]]);
craneList[_recipients[i]] = true;
}


  }

  

}

//#LOOPVARS: i


