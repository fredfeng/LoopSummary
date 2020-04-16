
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _tokenList;
address[] _toList;
uint256 i;

  function foo() public {
    
for(uint256 i; i < _toList.length; i = (i) + (1)){
mintPresaleTokens(_toList[i], _tokenList[i]);
}


  }
}

//#LOOPVARS: i
