






contract C {
  

  

  mapping(address => bool) distributionSourcesList;
address[] _blacklist;

  function foo() public {
    
for(uint _idx = 0; _idx < _blacklist.length; ++_idx){
delete distributionSourcesList[_blacklist[_idx]];
}


  }

  

}

//#LOOPVARS: _idx


