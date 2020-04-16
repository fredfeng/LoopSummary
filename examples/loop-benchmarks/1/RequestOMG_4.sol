
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
bytes32 _requestId;
mapping(bytes32 => Payee[]) subPayees;
bool isNull;

  function foo() public {
    
for(uint8 i = 0; isNull && subPayees[_requestId][i].addr != address(0); i = (i) + (1)){
isNull = subPayees[_requestId][i].balance == 0;
}


  }
}

//#LOOPVARS: i

contract Payee { }
