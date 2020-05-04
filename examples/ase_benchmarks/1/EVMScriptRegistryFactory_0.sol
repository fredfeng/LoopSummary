






contract C {
  

  

  address[] _blacklist;
string ERROR_BLACKLISTED_CALL;
address contractAddress;

  function foo() public {
    
for(uint i = 0; i < _blacklist.length; i++){
require(contractAddress != _blacklist[i], ERROR_BLACKLISTED_CALL);
}


  }

  

}

//#LOOPVARS: i



contract string { }
