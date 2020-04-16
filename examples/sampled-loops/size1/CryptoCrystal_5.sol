
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _sorted;
uint256 _min;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _sorted.length; i++){
if (_min < _sorted[i]) {
return i;
}

}


  }
}

//#LOOPVARS: i
