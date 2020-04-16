
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
bytes32 _requestId;
address _address;
mapping(bytes32 => Payee[]) subPayees;

  function foo() public {
    
for(uint8 i = 0; subPayees[_requestId][i].addr != address(0); i = (i) + (1)){
if (subPayees[_requestId][i].addr == _address) {
return i + 1;
}

}


  }
}

//#LOOPVARS: i

contract Payee { }
