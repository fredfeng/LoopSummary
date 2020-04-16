
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
RequestCore requestCore;
bytes32 _requestId;
uint256[] _subtractAmounts;

  function foo() public {
    
for(uint8 i = 0; i < _subtractAmounts.length; i = (i) + (1)){
if (_subtractAmounts[i] != 0) {
require(requestCore.getPayeeExpectedAmount(_requestId, i) >= _subtractAmounts[i].toInt256Safe(), "subtract should equal or be lower than amount expected");
requestCore.updateExpectedAmount(_requestId, i, -_subtractAmounts[i].toInt256Safe());
}

}


  }
}

//#LOOPVARS: i

contract RequestCore { }
