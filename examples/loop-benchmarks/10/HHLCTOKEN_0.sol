
pragma solidity ^0.5.10;



contract C {
  

  uint256 _var1;
uint256 _hundred;
uint256[] privateTimes;
uint256[] privateRates;
uint256 _idx;
uint256 _rate;
uint256 _idx2;
mapping(address => LockRuler[]) mapLockRulers;
uint256 _var3;
uint256 _lockMoney;
uint256 _var2;

  function foo() public {
    
for(_idx2 = 0; _idx2 < privateTimes.length - 1; _idx2++){
if (privateTimes[_idx2] <= block.timestamp && block.timestamp < privateTimes[_idx2 + 1]) {
_rate = privateRates[_idx2];
_var1 = (_hundred) - (_rate);
_var2 = (_var1) * (mapLockRulers[msg.sender][_idx].money);
_var3 = (_var2) / (_hundred);
_lockMoney = (_lockMoney) + (_var3);
break;
} else if (block.timestamp > privateTimes[privateTimes.length - 1]) {
_lockMoney = (_lockMoney) + (0);
break;
} else if (block.timestamp < privateTimes[0]) {
_lockMoney = (_lockMoney) + (mapLockRulers[msg.sender][_idx].money);
break;
}



}


  }
}

//#LOOPVARS: _idx2

contract LockRuler { }
