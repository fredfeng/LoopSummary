






contract C {
  

  

  uint256 _pageSize;
uint256[] page;
uint256 _from;
uint256[] itemList;

  function foo() public {
    
for(uint256 i = 0; i < _pageSize; i++){
page[i] = itemList[_from + i];
}


  }

  

}

//#LOOPVARS: i


