
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) distributionSourcesList;
uint _idx;
address[] _whitelist;

  function foo() public {
    
for(uint _idx = 0; _idx < _whitelist.length; ++_idx){
distributionSourcesList[_whitelist[_idx]] = true;
}


  }
}

//#LOOPVARS: _idx
