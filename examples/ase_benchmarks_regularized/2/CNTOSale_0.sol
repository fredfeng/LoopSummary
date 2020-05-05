






contract C {
  

  

  uint256 aid;
mapping(address => uint256) adminId;
mapping(uint256 => address) admins;
uint256 adminCount;

  function foo() public {
    
for(uint256 i = aid; i < adminCount; i++){
admins[i] = admins[i + 1];
adminId[admins[i]] = i;
}


  }

  

}

//#LOOPVARS: i


