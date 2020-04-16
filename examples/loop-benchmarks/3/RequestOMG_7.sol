
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
int256[] _expectedAmounts;
mapping(bytes32 => Payee[]) subPayees;
bytes32 _requestId;
address[] _payees;

  function foo() public {
    
for(uint8 i = 1; i < _payees.length; i = (i) + (1)){
require(_payees[i] != 0, "payee should not be 0");
subPayees[_requestId][i - 1] = Payee(_payees[i], _expectedAmounts[i], 0);
emit NewSubPayee(_requestId, _payees[i]);
}


  }
}

//#LOOPVARS: i

contract Payee { }

contract int256 { }
