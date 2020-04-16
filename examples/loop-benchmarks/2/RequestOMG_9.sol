
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
RequestCore requestCore;
bytes32 _requestId;
uint256[] _additionalAmounts;

  function foo() public {
    
for(uint8 i = 0; i < _additionalAmounts.length; i = (i) + (1)){
if (_additionalAmounts[i] != 0) {
requestCore.updateExpectedAmount(_requestId, i, _additionalAmounts[i].toInt256Safe());
}

}


  }
}

//#LOOPVARS: i

contract RequestCore { }
