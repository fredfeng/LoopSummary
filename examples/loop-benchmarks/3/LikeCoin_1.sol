
pragma solidity ^0.5.10;



contract C {
  

  address[] _poolAddrs;
uint i;
mapping(address => bool) isCreatorsPool;
address[] creatorsPoolAddrs;

  function foo() public {
    
for(uint i = 0; i < _poolAddrs.length; ++i){
require(_isContract(_poolAddrs[i]));
creatorsPoolAddrs.push(_poolAddrs[i]);
isCreatorsPool[_poolAddrs[i]] = true;
}


  }
}

//#LOOPVARS: i
