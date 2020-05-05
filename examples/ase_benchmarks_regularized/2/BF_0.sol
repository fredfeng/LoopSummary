






contract C {
  

  

  uint256[] _amtLst;
address[] _addrLst;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _addrLst.length; i++){
balances[_addrLst[i]] = ((balances[_addrLst[i]]) + (_amtLst[i]));
balances[this] = ((balances[this]) - (_amtLst[i]));

}


  }

  

}

//#LOOPVARS: i


