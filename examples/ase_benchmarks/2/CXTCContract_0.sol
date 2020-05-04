






contract C {
  

  

  mapping(address => uint256) freeBalances;
address[] _addressLst;
uint256[] _amountLst;
mapping(address => uint256) frozenBalances;

  function foo() public {
    
for(uint i = 0; i < _addressLst.length; i++){
freeBalances[_addressLst[i]] = ((freeBalances[_addressLst[i]]) + (_amountLst[i]));
frozenBalances[_addressLst[i]] = ((frozenBalances[_addressLst[i]]) - (_amountLst[i]));

}


  }

  

}

//#LOOPVARS: i


