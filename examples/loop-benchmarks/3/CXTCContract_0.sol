
pragma solidity ^0.5.10;



contract C {
  

  address[] _addressLst;
uint256[] _amountLst;
mapping(address => uint256) freeBalances;
mapping(address => uint256) frozenBalances;
uint i;

  function foo() public {
    
for(uint i = 0; i < _addressLst.length; i++){
freeBalances[_addressLst[i]] = (freeBalances[_addressLst[i]]) + (_amountLst[i]);
frozenBalances[_addressLst[i]] = (frozenBalances[_addressLst[i]]) - (_amountLst[i]);
Release(_addressLst[i], _amountLst[i]);
}


  }
}

//#LOOPVARS: i
