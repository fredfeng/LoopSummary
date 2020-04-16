
pragma solidity ^0.5.10;



contract C {
  

  uint256 to;
uint256 from;
uint256 i;
uint256[] ids;
uint256[] _ids;
uint256 results;

  function foo() public {
    
for(i = from; i <= to && i < results; i++){
ids[i] = _ids[i];
}


  }
}

//#LOOPVARS: i
