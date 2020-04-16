
pragma solidity ^0.5.10;



contract C {
  

  mapping(bytes32 => address[]) payeesPaymentAddress;
uint8 j;
address[] _payeesPaymentAddress;
bytes32 requestId;

  function foo() public {
    
for(uint8 j = 0; j < _payeesPaymentAddress.length; j = (j) + (1)){
payeesPaymentAddress[requestId][j] = _payeesPaymentAddress[j];
}


  }
}

//#LOOPVARS: j
