






contract C {
  

  

  uint256[] _amounts;
address[] _receivers;
uint256 cnt;
uint8 i;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
balances[_receivers[i]] = ((balances[_receivers[i]]) + (_amounts[i]));

}


  }

  

}

//#LOOPVARS: i


