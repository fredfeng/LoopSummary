
pragma solidity ^0.5.10;



contract C {
  

  uint256 _var1;
uint256 _hundred;
uint256 _idx;
uint256 _rate;
uint256[] airdropRates;
uint256 _idx2;
mapping(address => LockRuler[]) mapLockRulers;
uint256[] airdropTimes;
uint256 _var3;
uint256 _lockMoney;
uint256 _var2;

  function foo() public {
    
for(_idx2 = 0; _idx2 < airdropTimes.length - 1; _idx2++){
if (airdropTimes[_idx2] <= block.timestamp && block.timestamp <= airdropTimes[_idx2 + 1]) {
_rate = airdropRates[_idx2];
_var1 = (_hundred) - (_rate);
_var2 = (_var1) * (mapLockRulers[msg.sender][_idx].money);
_var3 = (_var2) / (_hundred);
_lockMoney = (_lockMoney) + (_var3);
break;
} else if (block.timestamp > airdropTimes[airdropTimes.length - 1]) {
_lockMoney = (_lockMoney) + (0);
break;
} else if (block.timestamp < airdropTimes[0]) {
_lockMoney = (_lockMoney) + (mapLockRulers[msg.sender][_idx].money);
break;
}



}


  }
}

//#LOOPVARS: _idx2

contract LockRuler { }
