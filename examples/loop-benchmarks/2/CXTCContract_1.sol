
pragma solidity ^0.5.10;



contract C {
  

  address[] _addressLst;
uint256[] _amountLst;
mapping(address => uint256) freeBalances;
address systemAcc;
uint i;

  function foo() public {
    
for(uint i = 0; i < _addressLst.length; i++){
freeBalances[_addressLst[i]] = (freeBalances[_addressLst[i]]) + (_amountLst[i]);
Transfer(systemAcc, _addressLst[i], _amountLst[i]);
}


  }
}

//#LOOPVARS: i
