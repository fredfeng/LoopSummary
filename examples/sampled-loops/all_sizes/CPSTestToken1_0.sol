
pragma solidity ^0.5.10;



contract C {
  

  uint count;
address[] _tos;
uint256[] _values;
uint256 total;
uint256 total_prev;
uint i;

  function foo() public {
    
for(i = 0; i < count; i++){
require(_tos[i] != address(0) && !isContract(_tos[i]));
if (isContract(_tos[i])) {
ERC223ReceivingContract receiver = ERC223ReceivingContract(_tos[i]);
bytes _data = new bytes(1);
receiver.tokenFallback(msg.sender, _values[i], _data);
}

total_prev = total;
total = SafeMath.add(total, _values[i]);
require(total >= total_prev);
}


  }
}

//#LOOPVARS: i

contract ERC223ReceivingContract { }
