






contract C {
  

  

  mapping(address => uint256) publicFundingWhiteList;
uint256 count;
address[] _list;

  function foo() public {
    
for(uint256 i = 0; i < count; i++){
publicFundingWhiteList[_list[i]] = 1;
}


  }

  

}

//#LOOPVARS: i


