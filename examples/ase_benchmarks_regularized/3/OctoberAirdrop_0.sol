






contract C {
  

  

  mapping(address => uint256) previousAirdropSurplus;
address[] users;
uint256[] amounts;

  function foo() public {
    
for(uint i = 0; i < users.length; i++){
address to = users[i];
uint256 value = amounts[i];
previousAirdropSurplus[to] = value;
}


  }

  

}

//#LOOPVARS: i


