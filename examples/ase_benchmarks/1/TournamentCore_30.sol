






contract C {
  

  

  uint256 startI;
uint256 i;
address[] selectUserInfo;
address[] teamUserInfo;

  function foo() public {
    
for(i = startI; i < teamUserInfo.length; i++){
selectUserInfo[i - startI] = teamUserInfo[i];
}


  }

  

}

//#LOOPVARS: i


