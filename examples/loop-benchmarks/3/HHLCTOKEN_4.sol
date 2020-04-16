
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _moneys;
address[] _accounts;
mapping(address => LockRuler[]) mapLockRulers;
uint256 _idx;

  function foo() public {
    
for(_idx = 0; _idx < _accounts.length; _idx++){
LockRuler _lockRuler = LockRuler(_moneys[_idx], 1);
mapLockRulers[_accounts[_idx]].push(_lockRuler);
_transfer(_accounts[_idx], _moneys[_idx]);
}


  }
}

//#LOOPVARS: _idx

contract LockRuler { }
