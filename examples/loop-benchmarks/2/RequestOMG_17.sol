
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
address _address;
mapping(bytes32 => address[]) payeesPaymentAddress;
uint8 payeesCount;
bytes32 _requestId;
int16 payeeIndex;

  function foo() public {
    
for(uint8 i = 0; i < payeesCount && payeeIndex == -1; i = (i) + (1)){
if (payeesPaymentAddress[_requestId][i] == _address) {
payeeIndex = int16(i);
}

}


  }
}

//#LOOPVARS: i

contract int16 { }
