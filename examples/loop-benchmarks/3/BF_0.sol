
pragma solidity ^0.5.10;



contract C {
  

  address[] _addrLst;
uint i;
mapping(address => uint256) balances;
uint256[] _amtLst;

  function foo() public {
    
for(uint i = 0; i < _addrLst.length; i++){
balances[_addrLst[i]] = (balances[_addrLst[i]]) + (_amtLst[i]);
balances[this] = (balances[this]) - (_amtLst[i]);
emit Issue(_addrLst[i], _amtLst[i]);
}


  }
}

//#LOOPVARS: i
