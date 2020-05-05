






contract C {
  

  

  address[] accountKeys;
uint256 i;
address[] accountList;
uint256 page;

  function foo() public {
    
for(uint i = 0 + page * 10; i < 10; i++){
if (i < accountKeys.length) {
accountList[i - page * 10] = accountKeys[i];
}

}


  }

  

}

//#LOOPVARS: i


