
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
bytes32 _requestId;
mapping(bytes32 => Payee[]) subPayees;
int256 balance;

  function foo() public {
    
for(uint8 i = 0; subPayees[_requestId][i].addr != address(0); i = (i) + (1)){
balance = (balance) + (subPayees[_requestId][i].balance);
}


  }
}

//#LOOPVARS: i

contract int256 { }

contract Payee { }
