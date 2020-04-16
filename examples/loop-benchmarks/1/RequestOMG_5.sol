
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
bytes32 _requestId;
int256 expectedAmount;
mapping(bytes32 => Payee[]) subPayees;

  function foo() public {
    
for(uint8 i = 0; subPayees[_requestId][i].addr != address(0); i = (i) + (1)){
expectedAmount = (expectedAmount) + (subPayees[_requestId][i].expectedAmount);
}


  }
}

//#LOOPVARS: i

contract int256 { }

contract Payee { }
