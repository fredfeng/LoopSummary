
pragma solidity ^0.5.10;



contract C {
  

  uint256 _from;
uint256 i;
uint256[] itemList;
uint256[] page;
uint256 _pageSize;

  function foo() public {
    
for(uint256 i = 0; i < _pageSize; i++){
page[i] = itemList[_from + i];
}


  }
}

//#LOOPVARS: i
