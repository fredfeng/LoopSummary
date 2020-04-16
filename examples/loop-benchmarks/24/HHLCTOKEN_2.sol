
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => LockRuler[]) mapLockRulers;
uint256 _idx;

  function foo() public {
    
for(_idx = 0; _idx < mapLockRulers[msg.sender].length; _idx++){
if (mapLockRulers[msg.sender][_idx].utype == 0) {
for (_idx2 = 0; _idx2 < privateTimes.length - 1; _idx2++) {
if (privateTimes[_idx2] <= block.timestamp && block.timestamp < privateTimes[_idx2 + 1]) {
_rate = privateRates[_idx2];
_var1 = _hundred.sub(_rate);
_var2 = _var1.mul(mapLockRulers[msg.sender][_idx].money);
_var3 = _var2.div(_hundred);
_lockMoney = _lockMoney.add(_var3);
break;
} else if (block.timestamp > privateTimes[privateTimes.length - 1]) {
_lockMoney = _lockMoney.add(0);
break;
} else if (block.timestamp < privateTimes[0]) {
_lockMoney = _lockMoney.add(mapLockRulers[msg.sender][_idx].money);
break;
}



}

}

if (mapLockRulers[msg.sender][_idx].utype == 1) {
for (_idx2 = 0; _idx2 < airdropTimes.length - 1; _idx2++) {
if (airdropTimes[_idx2] <= block.timestamp && block.timestamp <= airdropTimes[_idx2 + 1]) {
_rate = airdropRates[_idx2];
_var1 = _hundred.sub(_rate);
_var2 = _var1.mul(mapLockRulers[msg.sender][_idx].money);
_var3 = _var2.div(_hundred);
_lockMoney = _lockMoney.add(_var3);
break;
} else if (block.timestamp > airdropTimes[airdropTimes.length - 1]) {
_lockMoney = _lockMoney.add(0);
break;
} else if (block.timestamp < airdropTimes[0]) {
_lockMoney = _lockMoney.add(mapLockRulers[msg.sender][_idx].money);
break;
}



}

}

}


  }
}

//#LOOPVARS: _idx

contract LockRuler { }
